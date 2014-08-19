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
#import <QuartzCore/QuartzCore.h>

@protocol ResizeControlViewDelegate;

@interface ResizeControl : UIView

@property (nonatomic, weak) id<ResizeControlViewDelegate> delegate;
@property (nonatomic, readonly) CGPoint translation;

@end

@protocol ResizeControlViewDelegate <NSObject>

- (void)resizeControlViewDidBeginResizing:(ResizeControl *)resizeControlView;
- (void)resizeControlViewDidResize:(ResizeControl *)resizeControlView;
- (void)resizeControlViewDidEndResizing:(ResizeControl *)resizeControlView;

@end
