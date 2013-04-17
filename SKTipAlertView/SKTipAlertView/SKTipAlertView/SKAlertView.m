//
//  SKAlertView.m
//  SKTipAlertView
//
//  Created by SaKKoPro on 4/17/56 BE.
//  Copyright (c) 2556 SaKKoPro. All rights reserved.
//

#import "SKAlertView.h"
#import <QuartzCore/QuartzCore.h>

#define SK_ALERT_VIEW_WIDTH 280
#define SK_ALERT_VIEW_HEIGHT 30

@interface SKAlertView ()
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIImageView *backgroundImageview;
@end
@implementation SKAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundImageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [_backgroundImageview setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_backgroundImageview];
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width-10, self.frame.size.height)];
        [_contentLabel setBackgroundColor:[UIColor clearColor]];
        [_contentLabel setTextAlignment:NSTextAlignmentCenter];
        [_contentLabel setTextColor:[UIColor whiteColor]];
        [_contentLabel setFont:[UIFont systemFontOfSize:12]];
        [_contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [_contentLabel setNumberOfLines:0];
        [self addSubview:_contentLabel];
    }
    return self;
}

-(void)setbackgroundImage:(UIImage*)image{
    [self.backgroundImageview setImage:image];
}

-(void)setText:(NSString*)text{
    [self.contentLabel setText:text];
}

@end
