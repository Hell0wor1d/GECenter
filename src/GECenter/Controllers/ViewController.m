//
//  ViewController.m
//  GECenter
//
//  Created by Kevin Wang on 14-4-7.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "UIView+UIKeyboardExtension.h"
#import "KevAlertView.h"
#import "LoginViewController.h"
@interface ViewController ()
{
    NSObject* _myLockObj;
}

@end

@implementation ViewController
@synthesize startButton = _startButton;
@synthesize contentTextView = _contentTextView;
@synthesize inputTextField = _inputTextField;
@synthesize spinner = _spinner;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _myLockObj = [NSObject new];
    [_inputTextField addKeyboradExtension];
    [_contentTextView addKeyboradExtension];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)startWork:(id)sender
{
    [self showCreateAccountView];
}

- (IBAction)showAlertView:(id)sender {
    //[sender becomeFirstResponder];
    
    KevAlertView *alert = [[KevAlertView alloc] initWithTitle:@"恭喜哟" contentText:@"你已经成功测试了弹窗\n喜欢不？" leftButtonTitle:@"知道了" rightButtonTitle:@"挺好的"];
    [alert show];
    
    alert.leftBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.rightBlock = ^() {
        NSLog(@"right button clicked");
    };
    alert.dismissBlock = ^() {
        NSLog(@"Do something interesting after dismiss block");
    };
}

-(void) appendToTextView:(NSString *)text
{
    @synchronized(_myLockObj){
        _contentTextView.text = [_contentTextView.text stringByAppendingString:[NSString stringWithFormat:@"\n%@\n", text]];
    }
}

- (void)showCreateAccountView
{
    LoginViewController *createAccountViewController = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:createAccountViewController animated:YES];
}
@end
