//
//  UIView+UIKeyBoardExtension.m
//  GECenter
//
//  Created by Kevin Wang on 14-4-7.
//  Copyright (c) 2014年 Kevin Wang. All rights reserved.
//
#import "UIView+UIKeyboardExtension.h"

#define CHECK_OBJECT_SETTEXT [self respondsToSelector:@selector(setText:)]
#define SET_TEXTINPUT(CONTENT) [self performSelector:@selector(setText:) withObject:CONTENT]
@class UITextField, UITextView;
@implementation UIView (UIKeyboardExtension)

-(void) addKeyboradExtension
{
    if (!CHECK_OBJECT_SETTEXT) {
        return;
    }
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    
    [topView setBarStyle:UIBarStyleDefault];
    
    UIBarButtonItem * clearButton = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStyleBordered target:self action:@selector(ClearInput)];
    
    UIBarButtonItem * helloButton = [[UIBarButtonItem alloc]initWithTitle:@"Hello" style:UIBarButtonItemStyleBordered target:self action:@selector(quickInput:)];
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:clearButton,helloButton,btnSpace,doneButton,nil];
    
    [topView setItems:buttonsArray];
    [self performSelector:@selector(setInputAccessoryView:) withObject:topView];
    
    //UITextView自定选择文字后的菜单
    //在ViewDidLoad中加入：
    //UIMenuItem *menuItem = [[UIMenuItem alloc]initWithTitle:@"分享到新浪微博" action:@selector(changeColor:)];
    //UIMenuController *menu = [UIMenuController sharedMenuController];
    //[menu setMenuItems:[NSArray arrayWithObject:menuItem]];
    //[menuItem release];
}

-(void)dismissKeyBoard
{
    [self resignFirstResponder];
}

-(void)ClearInput
{
    if (CHECK_OBJECT_SETTEXT) {
        SET_TEXTINPUT(@"");
    }
    
}

-(void)quickInput:(id)sender
{
    if (CHECK_OBJECT_SETTEXT) {
        SET_TEXTINPUT(((UIBarButtonItem *)sender).title);
    }
}

@end
