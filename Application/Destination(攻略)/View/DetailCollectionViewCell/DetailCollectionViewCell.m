//
//  DetailCollectionViewCell.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/13.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DetailCollectionViewCell.h"
#import "DetailModel.h"
#import "YYWebImage.h"

#import "Define.h"

@interface DetailCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameZhLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameEnLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)pressDestination:(UIButton *)sender;
- (IBAction)pressJourney:(UIButton *)sender;
- (IBAction)pressSpecial:(UIButton *)sender;
- (IBAction)pressSite:(UIButton *)sender;

@end

@implementation DetailCollectionViewCell
#pragma mark - Life Circle
- (void)awakeFromNib
{

}

#pragma mark - Reload
- (void) reloadCellWithModel:(DetailModel *)model
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
}

#pragma mark - Action
- (IBAction)pressDestination:(UIButton *)sender
{
    sender.selected = !sender.selected;
    NSLog(@"攻略");
}

- (IBAction)pressJourney:(UIButton *)sender
{
    sender.selected = !sender.selected;
    NSLog(@"行程");
}

- (IBAction)pressSpecial:(UIButton *)sender
{
    sender.selected = !sender.selected;
    NSLog(@"专题");
}

- (IBAction)pressSite:(UIButton *)sender
{
    sender.selected = !sender.selected;
    NSLog(@"旅行地");
}

@end
