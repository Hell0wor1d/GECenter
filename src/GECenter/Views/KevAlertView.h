//
//  KevAlertView.h
//  GECenter
//
//  Created by Kevin Wang on 14-4-8.
//  Copyright (c) 2014年 Kevin Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KevAlertView : UIView

- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle;

- (void)show;

@property (nonatomic, copy) dispatch_block_t leftBlock;
@property (nonatomic, copy) dispatch_block_t rightBlock;
@property (nonatomic, copy) dispatch_block_t dismissBlock;

@end

@interface UIImage (colorful)

+ (UIImage *)imageWithColor:(UIColor *)color;

@end
