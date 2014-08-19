//  _   __              ______
//  | | / /             |___  /
//  | |/ /   ___ __   __   / /  _ __
//  |    \  / _ \\ \ / /  / /  | '_ \
//  | |\  \|  __/ \ V / ./ /   | | | |
//  \_| \_/ \___|  \_/  \_/    |_| |_|
//
//  部分逻辑基于MIT协议下的开源代码
//  Created by Kevin Wang on 14-6-26.
//  Copyright (c) 2014年 Kevin Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common/CameraDefines.h"

@protocol CameraNavigationControllerDelegate;

@interface CameraNavigationController : UINavigationController

- (void)showCameraWithParentController:(UIViewController*)parentController;

@property (nonatomic, assign) id <CameraNavigationControllerDelegate> cameraNaigationDelegate;

@end

@protocol CameraNavigationControllerDelegate <NSObject>

@optional
- (BOOL)willDismissNavigationController:(CameraNavigationController*)navigatonController;

- (void)didTakePicture:(CameraNavigationController*)navigationController image:(UIImage*)image;

@end
