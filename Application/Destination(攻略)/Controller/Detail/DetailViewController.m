//
//  DetailViewController.m
//  CYJObjectiveC
//
//  Created by 千锋 on 16/7/13.
//  Copyright © 2016年 菅思博. All rights reserved.
//

#import "DetailViewController.h"

#import "DetailModel.h"

#import "DetailCollectionViewCell.h"

#import "Define.h"

#import "HYBNetworking.h"
#import "YYModel.h"

/**test**/
#import "YYFPSLabel.h"

@interface DetailViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSource;

/**test**/
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

static NSString *kDetailCell = @"detailCollectionViewCell";

@implementation DetailViewController
#pragma mark - Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**test**/
    [self testFPSLabel];
    
    _dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@攻略", _itemTitle];
    [self createNavigationItem];
    
    [self setNetWorking];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(WIDTH(self.view) - 25, (WIDTH(self.view) - 25 ) * 0.65);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH(self.view), HEIGHT(self.view)) collectionViewLayout:flowLayout];
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = kColor(229, 239, 244, 1);
    
    _collectionView.showsVerticalScrollIndicator = NO;
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    _collectionView.contentInset = UIEdgeInsetsMake(0, 0, tabBarHeight + navigationBarHeight + 10, 0);
    
    UINib *detailCollectionViewCell = [UINib nibWithNibName:@"DetailCollectionViewCell" bundle:nil];
    [_collectionView registerNib:detailCollectionViewCell forCellWithReuseIdentifier:kDetailCell];
}

#pragma mark - Set NetWorking
- (void) setNetWorking
{
    [HYBNetworking getWithUrl:_url refreshCache:YES success:^(id response) {
        for (NSDictionary *dict in response)
        {
            DetailModel *model = [DetailModel yy_modelWithDictionary:dict];
            [_dataSource addObject:model];
        }
        [self.collectionView reloadData];
    } fail:^(NSError *error) {
        
    }];
}

#pragma mark - Create Navigationitem
- (void) createNavigationItem
{
    UIBarButtonItem *leftItem = [self createBarButtonItemWithImage:@"nav_back_icon@2x" andAction:@selector(pressLeftBarButtonItem)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [self createBarButtonItemWithImage:@"nav_share_icon@2x" andAction:@selector(pressRightBarButtonItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (UIBarButtonItem *) createBarButtonItemWithImage: (NSString *) imageName andAction: (SEL) action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"png"]] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 20, 20);
    
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    return item;
}

#pragma mark - CollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (0 == _dataSource.count)
    {
        return 0;
    }
    else
    {
        return _dataSource.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDetailCell forIndexPath:indexPath];
    
    [cell reloadCellWithModel:_dataSource[indexPath.row]];

    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark - CollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%lu被点击了", indexPath.row);
}

#pragma mark - Test
- (void)testFPSLabel
{
    _fpsLabel = [YYFPSLabel new];
    _fpsLabel.frame = CGRectMake(250, 10, 50, 30);
    [_fpsLabel sizeToFit];
    [self.navigationController.navigationBar addSubview:_fpsLabel];
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
