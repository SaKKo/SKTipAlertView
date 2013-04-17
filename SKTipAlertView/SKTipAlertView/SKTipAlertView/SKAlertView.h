//
//  SKAlertView.h
//  SKTipAlertView
//
//  Created by SaKKoPro on 4/17/56 BE.
//  Copyright (c) 2556 SaKKoPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKAlertView : UIView

@property (nonatomic,readonly) UILabel *contentLabel;

-(void)setbackgroundImage:(UIImage*)image;
-(void)setText:(NSString*)text;

@end
