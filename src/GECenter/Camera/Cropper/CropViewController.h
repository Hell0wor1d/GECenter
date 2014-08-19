//
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

#import <UIKit/UIKit.h>

@protocol CropViewControllerDelegate;

@interface CropViewController : UIViewController

@property (nonatomic, weak) id<CropViewControllerDelegate> delegate;
@property (nonatomic) UIImage *image;

@property (nonatomic) BOOL keepingCropAspectRatio;
@property (nonatomic) CGFloat cropAspectRatio;

@property (nonatomic) CGRect cropRect;
@property (nonatomic) CGRect imageCropRect;

@property (nonatomic) BOOL toolbarHidden;

- (void)resetCropRect;
- (void)resetCropRectAnimated:(BOOL)animated;

@end

@protocol CropViewControllerDelegate <NSObject>

- (void)cropViewController:(CropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage;
- (void)cropViewControllerDidCancel:(CropViewController *)controller;

@end
