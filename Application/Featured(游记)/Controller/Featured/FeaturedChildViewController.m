//
//  FeaturedChildViewController.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/9.
//  Copyright © 2016年 菅思博. All rights reserved.
//


#import "FeaturedChildViewController.h"

#import "FeaturedModel.h"

#import "FeaturedCollectionViewCell.h"

#import "ZJScrollPageViewDelegate.h"

#import "URLDefine.h"
#import "Define.h"

#import "HYBNetworking.h"
#import "MJRefresh.h"
#import "YYModel.h"

/**test**/
#import "YYFPSLabel.h"

@interface FeaturedChildViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, ZJScrollPageViewChildVcDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (assign, nonatomic) int page;

/**test**/
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

static NSString *kFeaturedCell = @"featuredCollectionViewCell";

@implementation FeaturedChildViewController
#pragma mark - Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**test**/
    [self testFPSLabel];
    
    _dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    _page = 1;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 5;
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0);
    flowLayout.itemSize = CGSizeMake(WIDTH(self.view), 0.6 * WIDTH(self.view));
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH(self.view), HEIGHT(self.view)) collectionViewLayout:flowLayout];
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = kColor(229, 239, 244, 1);
    
    _collectionView.showsVerticalScrollIndicator = NO;
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, tabBarHeight + navigationBarHeight + titleScrollViewHeight + 5, 0);
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _page++;
        [self setNetWorking];
    }];
    
    UINib *featuredCollectionViewCell = [UINib nibWithNibName:@"FeaturedCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:featuredCollectionViewCell forCellWithReuseIdentifier:kFeaturedCell];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Set NetWorking
- (void) setNetWorking
{
    NSString *urlString = [NSString stringWithFormat:kURLfeatured, _page];
    [HYBNetworking getWithUrl:urlString refreshCache:YES success:^(id response) {
        [self.collectionView.mj_footer endRefreshing];
        for (NSDictionary *dict in response)
        {
            FeaturedModel *model = [FeaturedModel yy_modelWithDictionary:dict];
            [_dataSource addObject:model];
        }
        [self.collectionView reloadData];
    } fail:^(NSError *error) {
        [self.collectionView.mj_header endRefreshing];
    }];
}

#pragma mark - CollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (0 == _dataSource.count)
    {
        return 0;
    }
    else if ([self.title isEqualToString:@"游记"])
    {
        return _dataSource.count;
    }
    else if ([self.title isEqualToString:@"专题"])
    {
        return 0;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FeaturedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFeaturedCell forIndexPath:indexPath];
    
    if ([self.title isEqualToString:@"游记"])
    {
        [cell reloadCellWithModel:[_dataSource objectAtIndex:indexPath.row]];
    }
    else if ([self.title isEqualToString:@"专题"])
    {
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark - CollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"游记 %lu is select", indexPath.row);
}

#pragma mark - ZJScrollPageViewChildVcDelegate
- (void) setUpWhenViewWillAppearForTitle:(NSString *)title forIndex:(NSInteger)index firstTimeAppear:(BOOL)isFirstTime
{
    if (isFirstTime)
    {
        if ([title isEqualToString:@"游记"])
        {
            self.title = @"游记";
            [self setNetWorking];
        }
    }
}

#pragma mark - Test
- (void)testFPSLabel
{
    _fpsLabel = [YYFPSLabel new];
    _fpsLabel.frame = CGRectMake(250, 10, 50, 30);
    [_fpsLabel sizeToFit];
    [self.navigationController.navigationBar addSubview:_fpsLabel];
}

@end
