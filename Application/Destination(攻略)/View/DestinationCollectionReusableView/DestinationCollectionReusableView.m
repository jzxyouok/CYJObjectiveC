//
//  DestinationCollectionReusableView.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/13.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DestinationCollectionReusableView.h"

@interface DestinationCollectionReusableView ()

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;

@end

@implementation DestinationCollectionReusableView
#pragma mark - Life Circle
- (void)awakeFromNib
{
    
}

#pragma mark - Set
- (void) setWithTitle:(NSString *)title
{
    _headerLabel.text = title;
}

@end
