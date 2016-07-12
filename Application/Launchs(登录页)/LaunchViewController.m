//
//  LaunchViewController.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "LaunchViewController.h"
#import "AppDelegate.h"
#import "TabBarViewController.h"

@interface LaunchViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;

@end

@implementation LaunchViewController
#pragma mark - Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TabBarViewController *tabBarViewController = [[TabBarViewController alloc]init];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       [UIView animateWithDuration:2.0 animations:^{
                           self.launchImageView.alpha = 0.0;
                           self.launchImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
                       } completion:^(BOOL finished) {
                           [UIApplication sharedApplication].keyWindow.rootViewController = tabBarViewController;
                       }];
                   });
}

@end
