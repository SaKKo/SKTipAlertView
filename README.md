SKTipAlertView
==============

iOS project UIView that popup either on top or bottom of the main UIWindow instance.

The Popup view will hide automatically or it can be set to hide only when the user tapped on the view.

![Screenshot: Launch image](https://github.com/SaKKo/SKTipAlertView/blob/master/BlueAlertScreenshot.png?raw=true)
![Screenshot: Launch image](https://github.com/SaKKo/SKTipAlertView/blob/master/GreenAlertScreenshot.png?raw=true)
![Screenshot: Launch image](https://github.com/SaKKo/SKTipAlertView/blob/master/RedAlertScreenshot.png?raw=true)
![Screenshot: Launch image](https://github.com/SaKKo/SKTipAlertView/blob/master/RedAlertMultiScreenshot.png?raw=true)

This Project use ARC as main and is created using iOS 6.0SDK.
However, it should work with iOS 5.0 or above. (tested)
The code is clean and easy to read.

Installation
------------
copy 2 files to your project
SKTipAlertView.h
SKTipAlertView.m


Usage
-----
To show popup,

    #import "SKTipAlertView.h"
  Create any UIView instance

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    [view setBackgroundColor:[UIColor redColor]];

  Pass it to SKTipAlertView together with type `SKTipAlertViewPositionBottom` or `SKTipAlertViewPositionTop`.

  `Duration` is in `second`, and when `Permanent` = `YES`, it means that the popup will wait for user to touch before dismissing the view.

    SKTipAlertView *alertView = [SKTipAlertView sharedTipAlertView];
    [alertView showNotificationForView:view forDuration:2 andPosition:SKTipAlertViewPositionBottom permanent:YES];

  Or just pass string to these functions to show Red/Green/Blue default alert

    [alertView showBlueNotificationForString:@"Blue Alert" forDuration:1 andPosition:SKTipAlertViewPositionBottom permanent:NO];

    [alertView showGreenNotificationForString:@"Green Alert" forDuration:1 andPosition:SKTipAlertViewPositionBottom permanent:NO];

    [alertView showRedNotificationForString:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." forDuration:1 andPosition:SKTipAlertViewPositionBottom permanent:YES];

Or see the Demo inside the project.


Feel free to give comment by emailing me. (sakko.sama@gmail.com)


License
-------

Copyright (c) 2013 SaKKo sama

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.