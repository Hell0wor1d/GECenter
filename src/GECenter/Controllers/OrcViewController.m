//
//  OrcViewController.m
//  GECenter
//
//  Created by Kevin Wang on 14-4-26.
//  Copyright (c) 2014年 Kevin Wang. All rights reserved.
//

#import "OrcViewController.h"
#import "WPNUXUtility.h"
#import "WPNUXMainButton.h"
#import "OrcImagePickerController.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#if TARGET_IPHONE_SIMULATOR
#define WifiInterfaceName @"en1"
#else
#define WifiInterfaceName @"en0"
#endif

// Log levels: off, error, warn, info, verbose
//static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface OrcViewController ()
{
    // Views
    UIView *_mainView;
    WPNUXMainButton *_cameraButton;
    WPNUXMainButton *_cannelButton;
    WPNUXMainButton *_httpServerButton;
    WPNUXMainButton *_engOCRButton;
    //OrcImagePickerController *_picker;
    UIImageView *_imageView;
}
@end

@implementation OrcViewController

//@synthesize httpServerButton = _httpServerButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [WPNUXUtility backgroundColor];
    _mainView = [[UIView alloc] init];
    _mainView.frame = self.view.bounds;
    _mainView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_mainView];
    
    _cameraButton = [[WPNUXMainButton alloc] init];
    [_cameraButton setTitle:NSLocalizedString(@"拍照", nil) forState:UIControlStateNormal];
    [_cameraButton addTarget:self action:@selector(cameraButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_cameraButton setExclusiveTouch:YES];
    [_cameraButton sizeToFit];
    [self.view addSubview:_cameraButton];
    
    _cannelButton = [[WPNUXMainButton alloc] init];
    [_cannelButton setTitle:NSLocalizedString(@"返回", nil) forState:UIControlStateNormal];
    [_cannelButton addTarget:self action:@selector(cannelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_cannelButton setExclusiveTouch:YES];
    [_cannelButton sizeToFit];
    [self.view addSubview:_cannelButton];
    
    _httpServerButton =[[WPNUXMainButton alloc] init];
    [_httpServerButton setTitle:@"中文" forState:UIControlStateNormal];
    [_httpServerButton addTarget:self action:@selector(httpServerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_httpServerButton setExclusiveTouch:YES];
    [_httpServerButton sizeToFit];
    [_httpServerButton setTag:0];
    [self.view addSubview:_httpServerButton];
    
    _engOCRButton =[[WPNUXMainButton alloc] init];
    [_engOCRButton setTitle:@"英文" forState:UIControlStateNormal];
    [_engOCRButton addTarget:self action:@selector(httpServerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_engOCRButton setExclusiveTouch:YES];
    [_engOCRButton sizeToFit];
    [_engOCRButton setTag:1];
    [self.view addSubview:_engOCRButton];
    
    
    _imageView = [[UIImageView alloc] init];
    [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:_imageView];
    CGFloat y;
    
    CGFloat viewWidth = CGRectGetWidth(self.view.bounds);
    CGFloat viewHeight = CGRectGetHeight(self.view.bounds);
    
    CGFloat btSpaceWidth = (viewWidth - (viewWidth * .2 * 4)) / 5;
    _cameraButton.frame = CGRectIntegral(CGRectMake(btSpaceWidth, viewHeight * 0.05, viewWidth * 0.2, 49));
    _cannelButton.frame = CGRectIntegral(CGRectMake(CGRectGetMaxX(_cameraButton.frame) + btSpaceWidth , viewHeight * 0.05, viewWidth * 0.2, 49));
    _httpServerButton.frame = CGRectIntegral(CGRectMake(CGRectGetMaxX(_cannelButton.frame)+ btSpaceWidth , viewHeight * 0.05, viewWidth * 0.2, 49));
    
    _engOCRButton.frame = CGRectIntegral(CGRectMake(CGRectGetMaxX(_httpServerButton.frame)+ btSpaceWidth , viewHeight * 0.05, viewWidth * 0.2, 49));
    
    y = CGRectGetMaxY(_cameraButton.frame);
    _imageView.frame = CGRectIntegral(CGRectMake(0, y, viewWidth, viewHeight - y));
    // Do any additional setup after loading the view.
    
    //[self configureNotification:YES];
}

-(void)recognizeImageWithTesseract:(UIImage *)img
                            sender:(id) sender
{
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //		[self.activityIndicator startAnimating];
    //	});
    // 设置识别语言，可用+号识别多种语言
    Tesseract* tesseract;
    //NSString *variables;
    switch ([(UIButton*)sender tag]) {
        case 0x00:
            tesseract = [[Tesseract alloc] initWithLanguage:@"chi_sim"];
            // Useful parameters for Japanese and Chinese 对于中文日文识别的优化参数
            [tesseract setVariableValue:@"T" forKey:@"chop_enable"];//Chop enable.
            [tesseract setVariableValue:@"F" forKey:@"use_new_state_cost"];//Use new state cost heuristics for segmentation state evaluation.
            [tesseract setVariableValue:@"F" forKey:@"segment_segcost_rating"];//Incorporate segmentation cost in word rating?
            [tesseract setVariableValue:@"0" forKey:@"enable_new_segsearch"];//Enable new segmentation search path. It could solve the problem of dividing one character to two characters.
            [tesseract setVariableValue:@"0" forKey:@"language_model_ngram_on"];//Turn on/off the use of character ngram model.
            [tesseract setVariableValue:@"T" forKey:@"textord_force_make_prop_words"];//Force proportional word segmentation on all rows.
            [tesseract setVariableValue:@"40" forKey:@"edges_max_children_per_outline"];//Max number of children inside a character outline. Increase this value if some of KANJI characters are not recognized (rejected).
            break;
        case 0x01:
            tesseract = [[Tesseract alloc] initWithLanguage:@"eng"];
            // 通过ascii 33~127生成，注意：有优先级存在
            //            char chars[95];
            //            for (int i=33; i<=126; i++) {
            //                chars[i-33] = (char)i;
            //            }
            //            chars[94] = '\0';
            //            variables = [[NSString stringWithCString:chars encoding:NSASCIIStringEncoding] stringByAppendingString:@"“”‘’"];
            [tesseract setVariableValue:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,.!@#$%^&*()_+~[]{}<>/?-=`'“”‘’';:\"" forKey:@"tessedit_char_whitelist"]; //设置识别变量
            break;
        default:
            tesseract = [[Tesseract alloc] initWithLanguage:@"chi_sim+eng"]; //chi_sim/eng..
            break;
    }
    tesseract.delegate = self;
    [tesseract setImage:img]; //image to check
    [tesseract recognize];
    
    NSString *recognizedText = [tesseract recognizedText];
    
    NSLog(@"%@", recognizedText);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [(WPNUXMainButton*)sender showActivityIndicator:false];
        [(WPNUXMainButton*)sender setEnabled:YES]; // To toggle enabled / disabled
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"内容：" message:recognizedText delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
        [alert show];
        
    });
    
    tesseract = nil; //deallocate and free all memory
}

- (BOOL)shouldCancelImageRecognitionForTesseract:(Tesseract*)tesseract {
    NSLog(@"progress: %d", tesseract.progress);
    return NO;  // return YES, if you need to interrupt tesseract before it finishes
}


#pragma mark - PECropViewControllerDelegate methods

- (void)cropViewController:(CropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
    _imageView.image = croppedImage;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        //[self updateEditButtonEnabled];
    }
}

- (void)cropViewControllerDidCancel:(CropViewController *)controller
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        //[self updateEditButtonEnabled];
    }
    
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

- (void)cameraButtonAction:(id)sender
{
    CameraNavigationController *nav = [[CameraNavigationController alloc] init];
    nav.cameraNaigationDelegate = self;
    [nav showCameraWithParentController:self];
}


-(void) cannelButtonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    //[self configureNotification:NO];
}

//- (void)configureNotification:(BOOL)toAdd {
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationTakePicture object:nil];
//    if (toAdd) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callbackNotificationForFilter:) name:kNotificationTakePicture object:nil];
//    }
//}

//- (void)callbackNotificationForFilter:(NSNotification*)noti {
//    UIViewController *cameraCon = noti.object;
//    if (!cameraCon) {
//        return;
//    }
//    UIImage *finalImage = [noti.userInfo objectForKey:kImage];
//    if (!finalImage) {
//        return;
//    }
//    CropViewController *controller = [[CropViewController alloc] init];
//    controller.delegate = self;
//    controller.image = finalImage;
//
//    //PostViewController *con = [[PostViewController alloc] init];
//    //con.postImage = finalImage;
//
//    if (cameraCon.navigationController) {
//        [cameraCon.navigationController pushViewController:controller animated:YES];
//    } else {
//        [cameraCon presentViewController:controller animated:YES completion:nil];
//    }
//}

#pragma mark - CameraNavigationController delegate
- (void)didTakePicture:(CameraNavigationController *)navigationController image:(UIImage *)image {
    //_imageView.image = image;
    CropViewController *controller = [[CropViewController alloc] init];
    controller.delegate = self;
    controller.image = image;
    UIImage *cimage = image;
    CGFloat width = cimage.size.width;
    CGFloat height = cimage.size.height;
    CGFloat length = MIN(width, height);
    controller.imageCropRect = CGRectMake((width - length) / 2,
                                          (height - length) / 2,
                                          length,
                                          length);
    //
    //    UINavigationController *cnavigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    //
    //    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    //        navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    //    }
    //
    //    [self presentViewController:cnavigationController animated:YES completion:NULL];
    [navigationController pushViewController:controller animated:YES];
}

-(void) httpServerAction:(id)sender
{
    if (!_imageView.image) {
        return;
    }
    WPNUXMainButton *button = (WPNUXMainButton *) sender;
    [button showActivityIndicator:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        
        [button setEnabled:NO]; // To toggle enabled / disabled
        
        [self recognizeImageWithTesseract:_imageView.image sender:button];
	});
}


- (NSString *)currentIPAddress
{
    NSString *address = @"";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = getifaddrs(&interfaces);
    
    if (success != 0) {
        freeifaddrs(interfaces);
        return address;
    }
    
    temp_addr = interfaces;
    while (temp_addr != NULL) {
        if (temp_addr->ifa_addr->sa_family == AF_INET) {
            if([@(temp_addr->ifa_name) isEqualToString:WifiInterfaceName])
                address = @(inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr));
        }
        temp_addr = temp_addr->ifa_next;
    }
    
    freeifaddrs(interfaces);
    return address;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
