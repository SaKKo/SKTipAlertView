//
//  SKTipAlertView.m
//  SKTipAlertView
//
//  initiated by SaKKo sama (cofounder Appximus Co.,Ltd.)
//  Copyright 2010, 2013 Appximus.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SKTipAlertView.h"

@interface SKTipAlertView ()
@property (nonatomic,strong) NSMutableArray *topArray;
@property (nonatomic,strong) NSMutableArray *bottomArray;
@end

@implementation SKTipAlertView

id sharedTipAlertView = nil;

+ (id)sharedTipAlertView {
    @synchronized(sharedTipAlertView) {
        if (!sharedTipAlertView) {
            sharedTipAlertView = [[[self class] alloc] init];
        }
    }
    return sharedTipAlertView;
}


-(id)init{
    self = [super init];
    if (self) {
        self.topArray = [NSMutableArray array];
        self.bottomArray = [NSMutableArray array];
    }
    return self;
}

-(void)showRedNotificationForString:(NSString*)content forDuration:(float)duration andPosition:(SKTipAlertViewPosition)position permanent:(BOOL)permanent{
    CGSize viewSize = [SKAlertView alertViewSizeForText:content andWidth:0];
    SKAlertView *view = [[SKAlertView alloc] initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    [view setbackgroundImage:[[UIImage imageNamed:@"SK-bgRed"] resizableImageWithCapInsets:UIEdgeInsetsMake(16, 16, 16, 16)]];
    [view setText:content];
    [self showNotificationForView:view forDuration:duration andPosition:position permanent:permanent];
}

-(void)showBlueNotificationForString:(NSString*)content forDuration:(float)duration andPosition:(SKTipAlertViewPosition)position permanent:(BOOL)permanent{
    CGSize viewSize = [SKAlertView alertViewSizeForText:content andWidth:0];
    SKAlertView *view = [[SKAlertView alloc] initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    [view setbackgroundImage:[[UIImage imageNamed:@"SK-bgBlue"] resizableImageWithCapInsets:UIEdgeInsetsMake(16, 16, 16, 16)]];
    [view setText:content];
    [self showNotificationForView:view forDuration:duration andPosition:position permanent:permanent];
}

-(void)showGreenNotificationForString:(NSString*)content forDuration:(float)duration andPosition:(SKTipAlertViewPosition)position permanent:(BOOL)permanent{
    CGSize viewSize = [SKAlertView alertViewSizeForText:content andWidth:0];
    SKAlertView *view = [[SKAlertView alloc] initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    [view setbackgroundImage:[[UIImage imageNamed:@"SK-bgGreen"] resizableImageWithCapInsets:UIEdgeInsetsMake(16, 16, 16, 16)]];
    [view setText:content];
    [self showNotificationForView:view forDuration:duration andPosition:position permanent:permanent];
}

-(void)showNotificationForView:(UIView*)view forDuration:(float)duration andPosition:(SKTipAlertViewPosition)position permanent:(BOOL)permanent{
    if (![view isKindOfClass:[UIView class]]) {
        NSLog(@"notification has to be instance of UIView");
        return;
    }
    if (duration <= 0) {
        duration = 1.5;
    }
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:view];
    
    float w = window.frame.size.width;
    float h = window.frame.size.height;
    float y = window.frame.origin.y;
    if (![[UIApplication sharedApplication] isStatusBarHidden]) {
        y+=20; //for status bar height
    }
    
    NSString *positionString;
    if (position == SKTipAlertViewPositionBottom) {
        positionString = @"bottom";
        [view setFrame:CGRectMake((w-view.frame.size.width)/2, h, view.frame.size.width, view.frame.size.height)];
    } else {
        positionString = @"top";
        [view setFrame:CGRectMake((w-view.frame.size.width)/2, y-view.frame.size.height, view.frame.size.width, view.frame.size.height)];
    }
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:view,@"view",positionString,@"position", nil];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    if (position == SKTipAlertViewPositionBottom) {
        [view setFrame:CGRectMake((w-view.frame.size.width)/2, h-view.frame.size.height, view.frame.size.width, view.frame.size.height)];
    } else {
        [view setFrame:CGRectMake((w-view.frame.size.width)/2, y, view.frame.size.width, view.frame.size.height)];
    }
    
    [UIView commitAnimations];
    if (permanent) {
        UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleHideTap:)];
        [view addGestureRecognizer:singleFingerTap];
        if (position == SKTipAlertViewPositionBottom) {
            [self.bottomArray addObject:view];
        } else {
            [self.topArray addObject:view];
        }
    } else {
        [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(hideNotificationView:) userInfo:userInfo repeats:NO];
    }
}

-(void)handleHideTap:(UITapGestureRecognizer*)sender{
    NSLog(@"handleHideTap %@",sender.view);
    UIView *view = sender.view;
    if ([self.bottomArray indexOfObject:view] != NSNotFound) {
        [self.bottomArray removeObject:view];
        [self hideView:view andPosition:SKTipAlertViewPositionBottom];
    } else {
        [self.topArray removeObject:view];
        [self hideView:view andPosition:SKTipAlertViewPositionTop];
    }
}

-(void)hideNotificationView:(NSTimer*)sender{
    NSLog(@"hideNotificationView %@",sender.userInfo);
    UIView *view = [sender.userInfo objectForKey:@"view"];
    NSString *positionString = [sender.userInfo objectForKey:@"position"];
    if ([positionString isEqualToString:@"bottom"]) {
        [self hideView:view andPosition:SKTipAlertViewPositionBottom];
    } else {
        [self hideView:view andPosition:SKTipAlertViewPositionTop];
    }
}

-(void)hideView:(UIView*)view andPosition:(SKTipAlertViewPosition)position{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    float w = window.frame.size.width;
    float h = window.frame.size.height;
    float y = window.frame.origin.y;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    if (position == SKTipAlertViewPositionBottom) {
        [view setFrame:CGRectMake((w-view.frame.size.width)/2, h, view.frame.size.width, view.frame.size.height)];
    } else {
        [view setFrame:CGRectMake((w-view.frame.size.width)/2, y-view.frame.size.height, view.frame.size.width, view.frame.size.height)];
    }
    [UIView commitAnimations];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:view,@"view", nil];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(destroyView:) userInfo:userInfo repeats:NO];
}
-(void)destroyView:(NSTimer*)sender{
    NSLog(@"destroyView %@",sender.userInfo); //just remove from windows so that arc will manage this
    UIView *view = [sender.userInfo objectForKey:@"view"];
    [view removeFromSuperview];
}
@end
