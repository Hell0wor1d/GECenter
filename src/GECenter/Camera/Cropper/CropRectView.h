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

@protocol CropRectViewDelegate;

@interface CropRectView : UIView

@property (nonatomic, weak) id<CropRectViewDelegate> delegate;
@property (nonatomic) BOOL showsGridMajor;
@property (nonatomic) BOOL showsGridMinor;

@property (nonatomic) BOOL keepingAspectRatio;

@end

@protocol CropRectViewDelegate <NSObject>

- (void)cropRectViewDidBeginEditing:(CropRectView *)cropRectView;
- (void)cropRectViewEditingChanged:(CropRectView *)cropRectView;
- (void)cropRectViewDidEndEditing:(CropRectView *)cropRectView;

@end

