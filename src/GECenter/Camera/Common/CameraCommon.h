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

#import <Foundation/Foundation.h>

@interface CameraCommon : NSObject

+ (UIImage*)createImageWithColor:(UIColor*)color size:(CGSize)imageSize;

+ (void)drawALineWithFrame:(CGRect)frame andColor:(UIColor*)color inLayer:(CALayer*)parentLayer;

+ (void)saveImageToPhotoAlbum:(UIImage*)image;

@end
