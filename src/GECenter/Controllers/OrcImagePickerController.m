//
//  OrcImagePickerController.m
//  GECenter
//
//  Created by Kevin Wang on 14-4-26.
//  Copyright (c) 2014年 Kevin Wang. All rights reserved.
//

#import "OrcImagePickerController.h"

@interface OrcImagePickerController ()
{
    CGPoint _lineStartPoint;
    CGPoint _lineEndPoint;
    UIView *_selectedView;
}
@end

@implementation OrcImagePickerController

@synthesize SelectCGRect = _selectCGRect;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Trace Touch Point

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    CGPoint touchPoint;
//    
//    UITouch *touch = [touches anyObject];
//    if (touch) {
//        touchPoint = [touch locationInView:self.view];
//        NSLog(@"touchesBegan : %f, %f\n", touchPoint.x, touchPoint.y);
//        
//        _lineStartPoint = touchPoint;
//    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    CGPoint touchPoint;
//    
//    UITouch *touch = [touches anyObject];
//    if (touch) {
//        touchPoint = [touch locationInView:self.view];
//        NSLog(@"touchesMoved : %f, %f\n", touchPoint.x, touchPoint.y);
//        //        NSArray *array = [self.view subviews];
//        //        for (UIView *view in array) {
//        //            [view removeFromSuperview];
//        //        }
//        //_lineEndPoint = touchPoint;
//        
//        
//        float w = touchPoint.x -_lineStartPoint.x;
//        //UIView *view = self.view;
//        //NSLog(@"%d",view.isHidden);
//        if (_selectedView) {
//            [_selectedView removeFromSuperview];
//        }
//        
//        //[self takePicture];
//        _selectedView = [[UIView alloc] initWithFrame:CGRectMake(_lineStartPoint.x, _lineStartPoint.y -15, w , 30)];
//        _selectedView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
//        [self.view addSubview:_selectedView];
//        _selectCGRect = _selectedView.frame;
//        //[self drawLineWithColor:[UIColor yellowColor] width:10.0f startPoint:_lineStartPoint endPoint:_lineEndPoint];
//    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
//    if ( [navigationController.viewControllers count] == 3 ) {
//        
//        //添加自定义信息层
//        CGRect f = self.view.bounds;
//        f.size.height -= self.navigationBar.bounds.size.height;
//        CGFloat barHeight = (f.size.height - f.size.width) / 2;
//        UIGraphicsBeginImageContext(f.size);
//        [[UIColor colorWithWhite:0 alpha:.5] set];
//        UIRectFillUsingBlendMode(CGRectMake(0, 0, f.size.width, barHeight), kCGBlendModeNormal);
//        UIRectFillUsingBlendMode(CGRectMake(0, f.size.height - barHeight, f.size.width, barHeight), kCGBlendModeNormal);
//        UIImage *overlayImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        
//        UIImageView *overlayIV = [[UIImageView alloc] initWithFrame:f];
//        overlayIV.image = overlayImage;
//        [viewController.view addSubview:overlayIV];
//    }
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
