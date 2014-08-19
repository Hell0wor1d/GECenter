//
//  OrcViewController.h
//  GECenter
//
//  Created by Kevin Wang on 14-4-26.
//  Copyright (c) 2014年 Kevin Wang. All rights reserved.
//

#import "ViewController.h"
#import "CameraNavigationController.h"
#import "CropViewController.h"
#import "TesseractOCR.h"

@class WPNUXMainButton;
@interface OrcViewController: ViewController<TesseractDelegate,CameraNavigationControllerDelegate, CropViewControllerDelegate>


//@property(nonatomic,readonly) WPNUXMainButton *httpServerButton;

@end
