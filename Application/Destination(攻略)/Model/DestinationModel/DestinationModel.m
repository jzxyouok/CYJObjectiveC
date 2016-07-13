//
//  DestinationModel.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/11.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DestinationModel.h"

@implementation DestinationModel
+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{
                    @"destinations":[Destinations class]
                    };
}
@end

@implementation Destinations

@end
