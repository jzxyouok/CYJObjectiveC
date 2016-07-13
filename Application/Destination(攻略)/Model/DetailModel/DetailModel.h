//
//  DetailModel.h
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/13.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@class Weather,Destination_Contents;

@interface DetailModel : NSObject <YYModel>

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, assign) BOOL wiki_app_publish;
@property (nonatomic, strong) NSArray<Destination_Contents *> *destination_contents;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, assign) NSInteger guides_count;
@property (nonatomic, copy) NSString *name_zh_cn;
@property (nonatomic, strong) NSArray<Weather *> *weather;
@property (nonatomic, assign) BOOL locked;
@property (nonatomic, assign) NSInteger updated_at;
@property (nonatomic, assign) NSInteger destination_trips_count;
@property (nonatomic, assign) NSInteger articles_count;
@property (nonatomic, assign) NSInteger plans_count;
@property (nonatomic, assign) NSInteger poi_count;
@property (nonatomic, assign) NSInteger contents_count;
@property (nonatomic, copy) NSString *name_en;

@end

@interface Weather : NSObject

@property (nonatomic, assign) NSInteger min_temperature;
@property (nonatomic, assign) NSInteger rain_days;
@property (nonatomic, assign) NSInteger max_temperature;

@end

@interface Destination_Contents : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description_html;

@end

