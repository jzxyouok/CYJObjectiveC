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
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"旅行攻略";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.childViewControllers = [self setupChildViewController];
    
    [self setupSegmentView];
    [self setupContentView];
}

#pragma mark - Setup ChildViewController
- (NSArray *) setupChildViewController
{
    DestinationChildViewController *childViewController1 = [[DestinationChildViewController alloc] init];
    DestinationChildViewController *childViewController2 = [[DestinationChildViewController alloc] init];
    
    NSArray *array = [NSArray arrayWithObjects:childViewController1, childViewController2, nil];
    return array;
}

#pragma mark - Setup SegmentView
- (void) setupSegmentView
{
    self.titles = @[@"国外", @"国内"];
    
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
    
    segment.backgroundImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"LYSegmentedSliderControlBackground" ofType:@"png"]];
    self.segmentView = segment;
    
    [self.view addSubview:_segmentView];
}

#pragma mark - Setup ContentView
- (void)setupContentView
{
    ZJContentView *content = [[ZJContentView alloc] initWithFrame:CGRectMake(0, 40, WIDTH(self.view), HEIGHT(self.view)) segmentView:self.segmentView parentViewController:self delegate:self];
    self.contentView = content;
    [self.view addSubview:self.contentView];
}

- (NSInteger)numberOfChildViewControllers
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

@end
