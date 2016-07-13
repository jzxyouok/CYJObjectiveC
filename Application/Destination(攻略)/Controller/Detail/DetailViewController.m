//
//  DetailViewController.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/13.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DetailViewController.h"
#import "DestinationChildViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
#pragma mark - Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@攻略", _itemTitle];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavigationItem];
}

#pragma mark - Create Navigationitem
- (void) createNavigationItem
{
    UIBarButtonItem *leftItem = [self createBarButtonItemWithImage:@"nav_back_icon" andAction:@selector(pressLeftBarButtonItem)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [self createBarButtonItemWithImage:@"nav_share_icon" andAction:@selector(pressRightBarButtonItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (UIBarButtonItem *) createBarButtonItemWithImage: (NSString *) imageName andAction: (SEL) action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 20, 20);
    
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    return item;
}

#pragma mark - Action
- (void) pressLeftBarButtonItem
{
    NSLog(@"left press");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) pressRightBarButtonItem
{
    NSLog(@"right press");
}

@end
