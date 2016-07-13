//
//  DetailCollectionViewCell.h
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/13.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailModel;

@interface DetailCollectionViewCell : UICollectionViewCell

- (void) reloadCellWithModel: (DetailModel *) model;

@end
