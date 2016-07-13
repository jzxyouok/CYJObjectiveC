//
//  TabBarViewController.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "TabBarViewController.h"

#import "FeaturedViewController.h"
#import "DestinationViewController.h"
#import "ToolboxViewController.h"
#import "MyViewController.h"
#import "OfflineViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController
#pragma mark - Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTabBarViewController];
    [self setupNavigationBarAppearance];
}

#pragma mark - Setup TabBarViewController
- (void) setupTabBarViewController
{
    FeaturedViewController *featuredViewController = [[FeaturedViewController alloc]init];
    UINavigationController *featuredNavigationController = [[UINavigationController alloc]initWithRootViewController:featuredViewController];
    
    DestinationViewController *destinationViewController = [[DestinationViewController alloc]init];
    UINavigationController *destinationNavigationController = [[UINavigationController alloc]initWithRootViewController:destinationViewController];
    
    ToolboxViewController *toolboxViewController = [[ToolboxViewController alloc]init];
    UINavigationController *toolboxNavigationController = [[UINavigationController alloc]initWithRootViewController:toolboxViewController];
    
    MyViewController *myViewController = [[MyViewController alloc]init];
    UINavigationController *myNavigationController = [[UINavigationController alloc]initWithRootViewController:myViewController];
    
    OfflineViewController *offlineViewController = [[OfflineViewController alloc]init];
    UINavigationController *offlineNavigationController = [[UINavigationController alloc]initWithRootViewController:offlineViewController];
    
    [self customizeTabBarForController];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setViewControllers:@[
                               featuredNavigationController,
                               destinationNavigationController,
                               toolboxNavigationController,
                               myNavigationController,
                               offlineNavigationController
                               ]];
}

- (void) customizeTabBarForController
{
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"游记",
                            CYLTabBarItemImage : @"TabBarIconFeaturedNormal",
                            CYLTabBarItemSelectedImage : @"TabBarIconFeatured",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"攻略",
                            CYLTabBarItemImage : @"TabBarIconDestinationNormal",
                            CYLTabBarItemSelectedImage : @"TabBarIconDestination",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"工具箱",
                            CYLTabBarItemImage : @"TabBarIconToolboxNormal",
                            CYLTabBarItemSelectedImage : @"TabBarIconToolbox",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"TabBarIconMyNormal",
                            CYLTabBarItemSelectedImage : @"TabBarIconMy"
                            };
    NSDictionary *dict5 = @{
                            CYLTabBarItemTitle : @"离线",
                            CYLTabBarItemImage : @"TabBarIconOfflineNormal",
                            CYLTabBarItemSelectedImage : @"TabBarIconOffline"
                            };
    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3, dict4, dict5];
    
    self.tabBarItemsAttributes = tabBarItemsAttributes;

    NSString *path = [[NSBundle mainBundle]pathForResource:@"TabBarBackground@2x"ofType:@"png"];
    self.tabBar.backgroundImage = [UIImage imageWithContentsOfFile:path];
}

#pragma mark - Setup NavigationBarAppearance
- (void) setupNavigationBarAppearance
{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"NavigationBarShadow"];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: [UIFont systemFontOfSize:18],
                                     NSForegroundColorAttributeName: [UIColor whiteColor],
                                     };
    [navigationBarAppearance setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

@end