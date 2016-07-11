//
//  Define.h
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#ifndef Define_h
#define Define_h

#pragma mark - 可复用
//  屏幕尺寸
#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.width
#define kScreenHeight [UIScreen mainScreen].bounds.height

//获取坐标
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

//  设置颜色
#define kColor(r, g, b, a) [UIColor colorWithRed:r / 255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

//  图片加载
#define kImageName(_name_) [UIImage imageNamed:_name_]

static CGFloat navigationBarHeight = 64;
static CGFloat titleScrollViewHeight = 40;
static CGFloat tabBarHeight = 49;

#endif /* Define_h */
