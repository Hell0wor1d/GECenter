//
//  GeneralWalkthroughViewController.h
//  WordPress
//
//  Created by Sendhil Panchadsaram on 4/30/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (nonatomic, assign) BOOL onlyDotComAllowed;
@property (nonatomic, assign) BOOL prefersSelfHosted;
@property (nonatomic, assign) BOOL showEditorAfterAddingSites;
@property (nonatomic, copy) void (^dismissBlock)();
@end
