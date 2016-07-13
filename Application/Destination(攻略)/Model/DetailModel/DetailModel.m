//
//  DetailModel.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/13.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel
+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{
                    @"destination_contents" : [Destination_Contents class],
                    @"weather" : Weather.class
                    };
}

@end

@implementation Weather

@end

@implementation Destination_Contents

@end


