SKTipAlertView
==============

iOS project UIView that popup either on top or bottom of the main UIWindow instance.

This Project use ARC as main and is created using iOS 6.0SDK.
However, it should work with iOS 4.3 or above. (tested)

Installation
------------
copy 2 files to your project
SKTipAlertView.h
SKTipAlertView.m


Usage
-----
To show popup,

  Create any UIView instance

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    [view setBackgroundColor:[UIColor redColor]];

  Pass it to SKTipAlertView

    SKTipAlertView *alertView = [SKTipAlertView sharedTipAlertView];
    [alertView showNotificationForView:view forDuration:2 andPosition:SKTipAlertViewPositionBottom permanent:YES];
