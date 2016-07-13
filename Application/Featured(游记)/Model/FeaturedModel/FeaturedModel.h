//
//  FeaturedModel.h
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@class FeaturedUserModel;

@interface FeaturedModel : NSObject <YYModel>

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *start_date;
@property (nonatomic, assign) NSInteger photos_count;
@property (nonatomic, copy) NSString *end_date;
@property (nonatomic, assign) BOOL featured;
@property (nonatomic, assign) NSInteger serial_id;
@property (nonatomic, assign) NSInteger views_count;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, assign) NSInteger serial_position;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger days;
@property (nonatomic, copy) NSString *front_cover_photo_url;
@property (nonatomic, assign) NSInteger comments_count;
@property (nonatomic, assign) NSInteger likes_count;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) FeaturedUserModel *user;

@end

@interface FeaturedUserModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *name;

@end

