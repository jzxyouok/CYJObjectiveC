//
//  DestinationChildViewController.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/11.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DestinationChildViewController.h"
#import "DestinationCollectionViewCell.h"
#import "DestinationCollectionReusableView.h"
#import "DestinationModel.h"
#import "ZJScrollPageViewDelegate.h"

#import "URLDefine.h"
#import "Define.h"

#import "HYBNetworking.h"
#import "MJRefresh.h"

/**test**/
#import "YYFPSLabel.h"

@interface DestinationChildViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ZJScrollPageViewChildVcDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSource;

/**test**/
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

static NSString *kDestinationCell = @"destinationCollectionViewCell";
static NSString *kHeader = @"destinationCollectionReusableView";

@implementation DestinationChildViewController
#pragma mark - Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**test**/
    [self testFPSLabel];
    
    _dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    flowLayout.headerReferenceSize = CGSizeMake(WIDTH(self.view), 30);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(WIDTH(self.view) / 2 - 13, (WIDTH(self.view) / 2 - 13) * 1.38);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH(self.view), HEIGHT(self.view)) collectionViewLayout:flowLayout];
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = kColor(229, 239, 244, 1);
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    _collectionView.contentInset = UIEdgeInsetsMake(0, 0, tabBarHeight + navigationBarHeight + titleScrollViewHeight, 0);
    
    UINib *destinationCollectionViewCell = [UINib nibWithNibName:@"DestinationCollectionViewCell" bundle:nil];
    [_collectionView registerNib:destinationCollectionViewCell forCellWithReuseIdentifier:kDestinationCell];
    
    UINib *destinationCollectionReusableView = [UINib nibWithNibName:@"DestinationCollectionReusableView" bundle:nil];
    [_collectionView registerNib:destinationCollectionReusableView forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeader];
}

#pragma mark - Set NetWorking
- (void) setNetWorking
{
    [HYBNetworking getWithUrl:KURLDes refreshCache:YES success:^(id response) {
        [self.collectionView.mj_footer endRefreshing];
        for (NSDictionary *dict in response)
        {
            DestinationModel *model = [[DestinationModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataSource addObject:model];
        }
        [self.collectionView reloadData];
    } fail:^(NSError *error) {

    }];
}

#pragma mark - CollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (0 == _dataSource.count)
    {
        return 0;
    }
    else if ([self.title isEqualToString:@"国外"])
    {
        switch (section)
        {
            case 0:
                return [_dataSource [0] destinations].count;
                break;
            case 1:
                return [_dataSource [1] destinations].count;
                break;
            case 2:
                return [_dataSource [2] destinations].count;
                break;
            default:
                break;
        }
    }
    else if ([self.title isEqualToString:@"国内"])
    {
        switch (section)
        {
            case 0:
                return [_dataSource [3] destinations].count;
                break;
            case 1:
                return [_dataSource [4] destinations].count;
                break;
            default:
                break;
        }
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDestinationCell forIndexPath:indexPath];
    
    if ([self.title isEqualToString:@"国外"])
    {
        switch (indexPath.section)
        {
            case 0:
                [cell reloadCellWithModel:(DestinationModel *)[_dataSource[0] destinations][indexPath.row]];
                break;
            case 1:
                [cell reloadCellWithModel:(DestinationModel *)[_dataSource[1] destinations][indexPath.row]];
                break;
            case 2:
                [cell reloadCellWithModel:(DestinationModel *)[_dataSource[2] destinations][indexPath.row]];
                break;
            default:
                break;
        }
    }
    else if ([self.title isEqualToString:@"国内"])
    {
        switch (indexPath.section)
        {
            case 0:
                [cell reloadCellWithModel:(DestinationModel *)[_dataSource[3] destinations][indexPath.row]];
                break;
            case 1:
                [cell reloadCellWithModel:(DestinationModel *)[_dataSource[4] destinations][indexPath.row]];
                break;
            default:
                break;
        }
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if ([self.title isEqualToString:@"国外"])
    {
        return 3;
    }
    else if ([self.title isEqualToString:@"国内"])
    {
        return 2;
    }
    return 1;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    DestinationCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeader forIndexPath:indexPath];
    
    if ([self.title isEqualToString:@"国外"])
    {
        switch (indexPath.section) {
            case 0:
                [view setWithTitle:@"亚洲"];
                break;
            case 1:
                [view setWithTitle:@"欧洲"];
                break;
            case 2:
                [view setWithTitle:@"美洲"];
                break;
            default:
                break;
        }
    }
    else if ([self.title isEqualToString:@"国内"])
    {
        switch (indexPath.section) {
            case 0:
                [view setWithTitle:@"港澳台"];
                break;
            case 1:
                [view setWithTitle:@"大陆"];
                break;
            default:
                break;
        }
    }
    return view;
}

#pragma mark - CollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.title isEqualToString:@"国外"])
    {
        switch (indexPath.section)
        {
            case 0:
                NSLog(@"亚洲 %lu is selete", indexPath.row);
                break;
            case 1:
                NSLog(@"欧洲 %lu is selete", indexPath.row);
                break;
            case 2:
                NSLog(@"美洲 %lu is selete", indexPath.row);
                break;
            default:
                break;
        }
    }
    else if ([self.title isEqualToString:@"国内"])
    {
        switch (indexPath.section)
        {
            case 0:
                NSLog(@"港澳台 %lu is selete", indexPath.row);
                break;
            case 1:
                NSLog(@"大陆 %lu is selete", indexPath.row);
                break;
            default:
                break;
        }
    }
}

#pragma mark - ZJScrollPageViewChildVcDelegate
- (void) setUpWhenViewWillAppearForTitle:(NSString *)title forIndex:(NSInteger)index firstTimeAppear:(BOOL)isFirstTime
{
    if (isFirstTime)
    {
        if ([title isEqualToString:@"国外"])
        {
            self.title = @"国外";
            [self setNetWorking];
        }
        else if ([title isEqualToString:@"国内"])
        {
            self.title = @"国内";
            [self setNetWorking];
        }
    }
}

#pragma mark - Test
- (void)testFPSLabel
{
    _fpsLabel = [YYFPSLabel new];
    _fpsLabel.frame = CGRectMake(200, 200, 50, 30);
    [_fpsLabel sizeToFit];
    [self.navigationController.navigationBar addSubview:_fpsLabel];
}

@end
