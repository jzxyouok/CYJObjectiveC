//
//  FeaturedModel.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "FeaturedModel.h"

@implementation FeaturedModel
- (void) setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"user"])
    {
        FeaturedUserModel *model = [[FeaturedUserModel alloc]init];
        [model setValuesForKeysWithDictionary:value];
        [super setValue:model forKey:key];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end

@implementation FeaturedUserModel

@end



