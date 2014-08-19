//
//  ViewController.h
//  GECenter
//
//  Created by Kevin Wang on 14-4-7.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,weak) IBOutlet UIButton *startButton;
@property(nonatomic,weak) IBOutlet  UITextView *contentTextView;
@property(nonatomic,weak) IBOutlet  UITextField *inputTextField;
@property(nonatomic,weak) IBOutlet  UIActivityIndicatorView *spinner;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)startWork:(id)sender;

- (IBAction)showAlertView:(id)sender;
@end
