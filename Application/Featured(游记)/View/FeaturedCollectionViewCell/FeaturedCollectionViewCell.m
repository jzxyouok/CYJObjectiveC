//
//  FeaturedCollectionViewCell.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "FeaturedCollectionViewCell.h"
#import "YYWebImage.h"
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
    [_photeImageView
        yy_setImageWithURL:[NSURL URLWithString:model.front_cover_photo_url]
                          placeholder:nil
                                 options:YYWebImageOptionSetImageWithFadeAnimation
                               manager:nil
                               progress:nil
                             transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
                                 image = [image yy_imageByResizeToSize:CGSizeMake(WIDTH(self.photeImageView), HEIGHT(self.photeImageView)) contentMode:UIViewContentModeScaleAspectFill];
                                 return image;
                             }
                          completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                              [_photeImageView setImage:image];
                          }];
    
    if (!model.featured)
    {
        _flagBestImageView.hidden = YES;
        self.flagLeading.constant = -35;
    }
    else
    {
        _flagBestImageView.hidden = NO;
        self.flagLeading.constant = 8;
    }
    
    [_userImageView
        yy_setImageWithURL:[NSURL URLWithString:model.user.image]
                          placeholder:nil
                                 options:YYWebImageOptionSetImageWithFadeAnimation
                               manager:nil
                               progress:nil
                             transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
                                 image = [image yy_imageByResizeToSize:CGSizeMake(WIDTH(self.userImageView), HEIGHT(self.userImageView)) contentMode:UIViewContentModeScaleAspectFill];
                                 return image;
                             }
                          completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                              [_userImageView setImage:image];
                          }];
    
    _nameLabel.text = model.name;
    
    _timeLabel.text = [NSString stringWithFormat:@"%@ / %lu天 / %lu图", model.end_date, model.days, model.photos_count];
}

@end
