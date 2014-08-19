//
//  OrcImagePickerController.h
//  GECenter
//
//  Created by Kevin Wang on 14-4-26.
//  Copyright (c) 2014年 Kevin Wang. All rights reserved.
//

#import "ViewController.h"

@interface OrcImagePickerController : UIImagePickerController
<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic) CGRect SelectCGRect;

@end
