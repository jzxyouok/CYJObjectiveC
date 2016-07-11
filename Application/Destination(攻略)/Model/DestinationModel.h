//
//  DestinationModel.h
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/11.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Destinations;

@interface DestinationModel : NSObject

@property (nonatomic, copy) NSString *category;
@property (nonatomic, strong) NSArray<Destinations *> *destinations;

@end

@interface Destinations : NSObject

@property (nonatomic, copy) NSString *name_en;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, copy) NSString *name_zh_cn;
@property (nonatomic, assign) float lat;
@property (nonatomic, assign) float lng;
@property (nonatomic, assign) NSInteger poi_count;
@property (nonatomic, assign) NSInteger updated_at;

@end
