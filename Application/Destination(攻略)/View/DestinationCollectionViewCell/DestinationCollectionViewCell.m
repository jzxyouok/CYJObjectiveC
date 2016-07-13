//
//  DestinationCollectionViewCell.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/11.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DestinationCollectionViewCell.h"
#import "DestinationModel.h"
#import "YYWebImage.h"

#import "Define.h"

@interface DestinationCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameZhLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameEnLabel;
@property (weak, nonatomic) IBOutlet UILabel *poiCountLabel;

@end

@implementation DestinationCollectionViewCell
#pragma mark - Life Circle
- (void)awakeFromNib
{
    
}

#pragma mark - Reload
- (void) reloadCellWithModel:(Destinations *)model
{
    [_imageView
        yy_setImageWithURL:[NSURL URLWithString:model.image_url]
                         placeholder:nil
                                options:YYWebImageOptionSetImageWithFadeAnimation
                              manager:nil
                              progress:nil
                            transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
                                image = [image yy_imageByResizeToSize:CGSizeMake(WIDTH(self.imageView), HEIGHT(self.imageView)) contentMode:UIViewContentModeScaleAspectFill];
                                return image;
                            }
                        completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                            [_imageView setImage:image];
                        }];
    
    _nameZhLabel.text = model.name_zh_cn;
    _nameEnLabel.text = model.name_en;
    
    _poiCountLabel.text = [NSString stringWithFormat:@"旅行地：%lu", model.poi_count];
}

@end
