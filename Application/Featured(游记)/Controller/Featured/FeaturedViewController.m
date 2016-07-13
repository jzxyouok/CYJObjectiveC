//
//  FeaturedViewController.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

/**
 *  注释：
 *  ZJScrollSegmentView.m文件中：583-585：增加
 *  imageView.layer.masksToBounds = YES;
 *  imageView.layer.cornerRadius = 5;
 
 *  ZJScrollSegmentView.m文件中：243，245，347，348，417，418：修改
 *  CGFloat coverX = firstLabel.zj_x + 2;
 *  CGFloat coverW = firstLabel.zj_width - 4;
 
 *  weakSelf.coverLayer.zj_x = currentLabel.zj_x + 2;
 *  weakSelf.coverLayer.zj_width = currentLabel.zj_width - 4;
 
 *  self.coverLayer.zj_x = oldLabel.zj_x + 2 + xDistance * progress;
 *  self.coverLayer.zj_width = oldLabel.zj_width - 4 + wDistance * progress;
 */

#import "FeaturedViewController.h"
#import "FeaturedChildViewController.h"
#import "ZJScrollPageView.h"
#import "Define.h"

@interface FeaturedViewController () <ZJScrollPageViewDelegate>

@property (copy, nonatomic) NSArray <NSString *> *titles;
@property (copy, nonatomic) NSArray <UIViewController <ZJScrollPageViewChildVcDelegate> *> *childViewControllers;
@property (weak, nonatomic) ZJScrollSegmentView *segmentView;
@property (weak, nonatomic) ZJContentView *contentView;

@end

@implementation FeaturedViewController
#pragma mark - Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"蝉游记";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.childViewControllers = [self setupChildViewController];

    [self setupSegmentView];
    [self setupContentView];
    
    [self createNavigationItem];
}

#pragma mark - Setup ChildViewController
- (NSArray *) setupChildViewController
{
    FeaturedChildViewController *childViewController1 = [[FeaturedChildViewController alloc] init];
    FeaturedChildViewController *childViewController2 = [[FeaturedChildViewController alloc] init];
    
    NSArray *array = [NSArray arrayWithObjects:childViewController1, childViewController2, nil];
    return array;
}

#pragma mark - Setup SegmentView
- (void) setupSegmentView
{
    self.titles = @[@"游记", @"专题"];
    
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc]init];

    style.showCover = YES;
    style.scrollTitle = NO;
    style.gradualChangeTitleColor = YES;
    
    style.coverBackgroundColor = [UIColor whiteColor];
    style.coverCornerRadius = 5;
    style.coverHeight = 30;

    style.normalTitleColor = kColor(68, 68, 68, 1);
    style.selectedTitleColor = kColor(17, 136, 219, 1);
    
    __weak typeof(self) weakSelf = self;
    
    ZJScrollSegmentView *segment = [[ZJScrollSegmentView alloc]initWithFrame:CGRectMake(10, 3, WIDTH(self.view) - 20, 34) segmentStyle:style titles:self.titles titleDidClick:^(UILabel *label, NSInteger index) {
        [weakSelf.contentView setContentOffSet:CGPointMake(weakSelf.contentView.bounds.size.width * index, 0) animated:YES];
    }];
    
    segment.backgroundImage = [UIImage imageNamed:@"LYSegmentedSliderControlBackground"];
    self.segmentView = segment;
    
    [self.view addSubview:_segmentView];
}

#pragma mark - Setup ContentView
- (void) setupContentView
{
    ZJContentView *content = [[ZJContentView alloc] initWithFrame:CGRectMake(0, 40, WIDTH(self.view), HEIGHT(self.view)) segmentView:self.segmentView parentViewController:self delegate:self];
    self.contentView = content;
    [self.view addSubview:self.contentView];
}

- (NSInteger) numberOfChildViewControllers
{
    return self.titles.count;
}

#pragma mark - ZJScrollPageViewDelegate
- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index
{
    UIViewController <ZJScrollPageViewChildVcDelegate> *childViewController = reuseViewController;
    
    if (!childViewController)
    {
        childViewController = self.childViewControllers[index];
    }
    
    return childViewController;
}


#pragma mark - Create Navigationitem
- (void) createNavigationItem
{
    UIBarButtonItem *leftItem = [self createBarButtonItemWithImage:@"nav_setting_icon" andAction:@selector(pressLeftBarButtonItem)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [self createBarButtonItemWithImage:@"nav_search_icon" andAction:@selector(pressRightBarButtonItem)];
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
}

- (void) pressRightBarButtonItem
{
    NSLog(@"right press");
}

@end
