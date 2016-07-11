//
//  FeaturedCollectionViewCell.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "FeaturedCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "FeaturedModel.h"

#import "Define.h"

@interface FeaturedCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *photeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *flagBestImageView;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *flagLeading;

@end

@implementation FeaturedCollectionViewCell
#pragma mark - life circle
- (void)awakeFromNib
{
}

#pragma mark - load
- (void) reloadCellWithModel:(FeaturedModel *)model
{
    [_photeImageView sd_setImageWithURL:[NSURL URLWithString:model.front_cover_photo_url]];
    
    if (!model.featured)
    {
        _flagBestImageView.hidden = YES;
        self.flagLeading.constant = -35;
    }
    else
    {
        _flagBestImageView.hidden = NO;
    }
    
    [_userImageView sd_setImageWithURL:[NSURL URLWithString:model.user.image]];
    
    _nameLabel.text = model.name;
    
    _timeLabel.text = [NSString stringWithFormat:@"%@ / %lu天 / %lu图", model.end_date, model.days, model.photos_count];
}

@end
