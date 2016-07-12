//
//  DestinationCollectionViewCell.h
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/11.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DestinationModel;

@interface DestinationCollectionViewCell : UICollectionViewCell

- (void) reloadCellWithModel: (DestinationModel *) model;

@end
