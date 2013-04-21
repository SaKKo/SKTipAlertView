//
//  SKTipAlertViewDemoVC.m
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

#import "SKTipAlertViewDemoVC.h"
#import "SKTipAlertView.h"
#import "DemoView.h"

@interface SKTipAlertViewDemoVC ()

@end

@implementation SKTipAlertViewDemoVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.row == 0) {
        [cell.textLabel setText:@"Bottom red permanent"];
    } else if (indexPath.row == 1) {
        [cell.textLabel setText:@"Bottom green auto 2 sec"];
    } else if (indexPath.row == 2) {
        [cell.textLabel setText:@"Top red permanent"];
    } else if (indexPath.row == 3) {
        [cell.textLabel setText:@"Top green auto 2 sec"];
    } else if (indexPath.row == 4) {
        [cell.textLabel setText:@"Show Demo View"];
    } else if (indexPath.row == 5) {
        [cell.textLabel setText:@"Show Red Alert from string"];
    } else if (indexPath.row == 6) {
        [cell.textLabel setText:@"Show Blue Alert from string"];
    } else if (indexPath.row == 7) {
        [cell.textLabel setText:@"Show Green Alert from string"];
    } else if (indexPath.row == 8) {
        [cell.textLabel setText:@"Red Alert Long multiline string"];
    }
    
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SKTipAlertView *alertView = [SKTipAlertView sharedTipAlertView];
    
    if (indexPath.row == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
        [view setBackgroundColor:[UIColor redColor]];
        [alertView showNotificationForView:view forDuration:2 andPosition:SKTipAlertViewPositionBottom permanent:YES];
    } else if (indexPath.row == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        [view setBackgroundColor:[UIColor greenColor]];
        [alertView showNotificationForView:view forDuration:2 andPosition:SKTipAlertViewPositionBottom permanent:NO];
    } else if (indexPath.row == 2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
        [view setBackgroundColor:[UIColor redColor]];
        [alertView showNotificationForView:view forDuration:2 andPosition:SKTipAlertViewPositionTop permanent:YES];
    } else if (indexPath.row == 3) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        [view setBackgroundColor:[UIColor greenColor]];
        [alertView showNotificationForView:view forDuration:2 andPosition:SKTipAlertViewPositionTop permanent:NO];
    } else if (indexPath.row == 4) {
        DemoView *demoView = [[DemoView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        [demoView.textLabel setText:@"Hello world"];
        [alertView showNotificationForView:demoView forDuration:2 andPosition:SKTipAlertViewPositionTop permanent:NO];
    } else if (indexPath.row == 5) {
        [alertView showRedNotificationForString:@"Red Alert" forDuration:1 andPosition:SKTipAlertViewPositionBottom permanent:NO];
    } else if (indexPath.row == 6) {
        [alertView showBlueNotificationForString:@"Blue Alert, Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." forDuration:1 andPosition:SKTipAlertViewPositionBottom permanent:NO];
    } else if (indexPath.row == 7) {
        [alertView showGreenNotificationForString:@"Green Alert" forDuration:1 andPosition:SKTipAlertViewPositionBottom permanent:NO];
    } else if (indexPath.row == 8) {
        [alertView showRedNotificationForString:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." forDuration:1 andPosition:SKTipAlertViewPositionBottom permanent:YES];
    }
}

@end
