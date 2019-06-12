//
//  UIView+Mask.m
//  Mask
//
//  Created by 吴焰基 on 2019/6/12.
//  Copyright © 2019 吴焰基. All rights reserved.
//

#import "UIView+Mask.h"

@implementation UIView (Mask)

- (void)maskWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(),
                          view.frame.origin.x,
                          view.frame.origin.y);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    // 设置遮罩图
    UIView *maskView = [[UIView alloc] init];
    maskView.frame = self.bounds;
    maskView.layer.contents = (__bridge id)(image.CGImage);
    
    self.maskView = maskView;
}

- (void)reverseMaskWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(),
                          view.frame.origin.x,
                          view.frame.origin.y);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 获取相反的遮罩图
    image = [self reverseMaskWithImage:image];
    
    // 设置取反的遮罩图
    UIView *maskView = [[UIView alloc] init];
    maskView.frame = self.bounds;
    maskView.layer.contents = (__bridge id)(image.CGImage);
    
    self.maskView = maskView;
}


- (UIImage *)reverseMaskWithImage:(UIImage *)image {
    CGImageRef originalMaskImage = [image CGImage];
    float width = CGImageGetWidth(originalMaskImage);
    float height = CGImageGetHeight(originalMaskImage);
    
    int strideLength = ceil(width);
    unsigned char * alphaData = calloc(strideLength * height, sizeof(unsigned char));
    CGContextRef alphaOnlyContext = CGBitmapContextCreate(alphaData,
                                                          width,
                                                          height,
                                                          8,
                                                          strideLength,
                                                          NULL,
                                                          kCGImageAlphaOnly);
    
    CGContextDrawImage(alphaOnlyContext, CGRectMake(0, 0, width, height), originalMaskImage);
    
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            unsigned char val = alphaData[y*strideLength + x];
            val = 255 - val;
            alphaData[y*strideLength + x] = val;
        }
    }
    
    CGImageRef alphaMaskImage = CGBitmapContextCreateImage(alphaOnlyContext);
    UIImage *result = [UIImage imageWithCGImage:alphaMaskImage];
    
    CGImageRelease(alphaMaskImage);
    CGContextRelease(alphaOnlyContext);
    free(alphaData);
    
    return result;
}


@end
