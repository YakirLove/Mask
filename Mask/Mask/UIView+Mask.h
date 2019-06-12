//
//  UIView+Mask.h
//  Mask
//
//  Created by 吴焰基 on 2019/6/12.
//  Copyright © 2019 吴焰基. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Mask)

- (void)maskWithView:(UIView *)view;

- (void)reverseMaskWithView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
