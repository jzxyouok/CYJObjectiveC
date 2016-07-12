//
//  FeaturedCollectionViewCell.h
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeaturedModel;

@interface FeaturedCollectionViewCell : UICollectionViewCell

- (void) reloadCellWithModel: (FeaturedModel *) model;

@end
