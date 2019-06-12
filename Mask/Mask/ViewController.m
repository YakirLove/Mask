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
    
    UIImageView *firstImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face"]];
    firstImgView.frame = CGRectMake((screenWidth-250)/2.0, 100, 250, 135);
    [self.view addSubview:firstImgView];
    
    
    UIImageView *secondImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face"]];
    secondImgView.frame = CGRectMake((screenWidth-250)/2.0, 300, 250, 135);
    [self.view addSubview:secondImgView];
    
    
    UIImageView *maskView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face_mask"]];
    maskView.frame = CGRectMake(105, 18, 76, 102);
    
    [firstImgView maskWithView:maskView];
    [secondImgView reverseMaskWithView:maskView];
    
}


@end
