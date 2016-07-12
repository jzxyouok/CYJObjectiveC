//
//  DestinationModel.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/11.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DestinationModel.h"

@implementation DestinationModel
- (void) setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"destinations"])
    {
        NSMutableArray *mutArray = [NSMutableArray array];
        for (NSDictionary *dict in value) {
            Destinations *model = [[Destinations alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [mutArray addObject:model];
        }
        _destinations = mutArray;
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end

@implementation Destinations

@end
