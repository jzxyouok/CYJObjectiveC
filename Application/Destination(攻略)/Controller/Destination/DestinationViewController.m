//
//  DestinationViewController.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DestinationViewController.h"
#import "DestinationChildViewController.h"
#import "ZJScrollPageView.h"
#import "Define.h"

@interface DestinationViewController () <ZJScrollPageViewDelegate>

@property (copy, nonatomic) NSArray <NSString *> *titles;
@property (copy, nonatomic) NSArray <UIViewController <ZJScrollPageViewChildVcDelegate> *> *childViewControllers;
@property (weak, nonatomic) ZJScrollSegmentView *segmentView;
@property (weak, nonatomic) ZJContentView *contentView;

@end

@implementation DestinationViewController
#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"旅行攻略";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.childViewControllers = [self setupChildViewController];
    
    [self setupSegmentView];
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setup childViewController
- (NSArray *) setupChildViewController
{
    DestinationChildViewController *childViewController1 = [[DestinationChildViewController alloc] init];
    DestinationChildViewController *childViewController2 = [[DestinationChildViewController alloc] init];
    DestinationChildViewController *childViewController3 = [[DestinationChildViewController alloc] init];
    
    NSArray *array = [NSArray arrayWithObjects:childViewController1, childViewController2, childViewController3, nil];
    return array;
}

#pragma mark - setup segmentView
- (void) setupSegmentView
{
    self.titles = @[@"国外", @"国内", @"附近"];
    
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc]init];
    
    style.showCover = YES;
    style.scrollTitle = NO;
    style.gradualChangeTitleColor = YES;
    
    style.coverBackgroundColor = [UIColor whiteColor];
    
    style.coverCornerRadius = 5;
    
    style.coverHeight = 30;
    
    style.normalTitleColor = [UIColor colorWithRed:68 / 255.0 green:68 / 255.0 blue:68 / 255.0 alpha:1.0];
    style.selectedTitleColor = [UIColor colorWithRed:17 / 255.0 green:136 / 255.0 blue:219 / 255.0 alpha:1.0];
    
    __weak typeof(self) weakSelf = self;
    ZJScrollSegmentView *segment = [[ZJScrollSegmentView alloc]initWithFrame:CGRectMake(10, 3, WIDTH(self.view) - 20, 34) segmentStyle:style titles:self.titles titleDidClick:^(UILabel *label, NSInteger index) {
        [weakSelf.contentView setContentOffSet:CGPointMake(weakSelf.contentView.bounds.size.width * index, 0) animated:YES];
    }];
    
    segment.backgroundImage = [UIImage imageNamed:@"LYSegmentedSliderControlBackground"];
    self.segmentView = segment;
    
    [self.view addSubview:_segmentView];
}

#pragma mark - setup contentView
- (void)setupContentView {
    ZJContentView *content = [[ZJContentView alloc] initWithFrame:CGRectMake(0, 40, WIDTH(self.view), HEIGHT(self.view)) segmentView:self.segmentView parentViewController:self delegate:self];
    self.contentView = content;
    [self.view addSubview:self.contentView];
}

- (NSInteger)numberOfChildViewControllers {
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

@end
