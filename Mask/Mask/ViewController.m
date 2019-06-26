//
//  ViewController.m
//  Mask
//
//  Created by 吴焰基 on 2019/6/12.
//  Copyright © 2019 吴焰基. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Mask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIImageView *maskView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face_mask"]];
    maskView.frame = CGRectMake(105, 18, 76, 102);
    
    UIImageView *firstImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face"]];
    firstImgView.frame = CGRectMake((screenWidth-250)/2.0, 100, 250, 135);
    [self.view addSubview:firstImgView];
    UIImageView *firstMaskImgView = [[UIImageView alloc] initWithImage:[ViewController createImageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] frame:CGRectMake(0, 0, 250, 135)]];
    firstMaskImgView.frame = firstImgView.frame;
    [self.view addSubview:firstMaskImgView];
    
    [firstMaskImgView maskWithView:maskView];
    
    
    UIImageView *secondImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face"]];
    secondImgView.frame = CGRectMake((screenWidth-250)/2.0, 300, 250, 135);
    [self.view addSubview:secondImgView];
    
    UIImageView *secondMaskImgView = [[UIImageView alloc] initWithImage:[ViewController createImageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] frame:CGRectMake(0, 0, 250, 135)]];
    secondMaskImgView.frame = secondImgView.frame;
    [self.view addSubview:secondMaskImgView];
    [secondMaskImgView reverseMaskWithView:maskView];
    
    
}


+ (UIImage *)createImageWithColor:(UIColor *)color frame:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
    
}

@end
