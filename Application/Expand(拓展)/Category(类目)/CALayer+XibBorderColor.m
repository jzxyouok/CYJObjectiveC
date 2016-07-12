//
//  CALayer+XibBorderColor.m
//  CYJObjectiveC
//
//  Created by 菅思博 on 16/7/12.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "CALayer+XibBorderColor.h"

@implementation CALayer (XibBorderColor)
#pragma mark - Action
- (void) setBorderUIColor:(UIColor *)borderUIColor
{
    self.borderColor = borderUIColor.CGColor;
}

- (UIColor *) borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
