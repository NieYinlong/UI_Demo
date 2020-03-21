//
//  UICollectionViewVC.m
//  UI_Demo
//
//  Created by nyl on 2020/3/18.
//  Copyright © 2020 nieyinlong. All rights reserved.
//

#import "UICollectionViewVC.h"
#import "MyCollectionViewCell.h"

@interface UICollectionViewVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation UICollectionViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(60);
    }];
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"黄芪", @"当归",@"党参hdjshdjs-end",@"熊掌订单的", @"黄芪", @"党参", @"当归", @"熊掌订单的", @"生姜生姜生姜生姜结束"];
        //
        //
    }
    return _dataSource;
}

#pragma mark -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    cell.nameLB.text = self.dataSource[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = self.dataSource[indexPath.row];
    // + 20是边距
    return CGSizeMake([self widthFont:[UIFont systemFontOfSize:17] withText:str] + 20, 60);
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
    }
    return _collectionView;
}

// 给我一个字符串 我还你一个宽度
- (CGFloat)widthFont:(UIFont *)font withText:(NSString *)text {
    NSDictionary *dic = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGRect frame = [text boundingRectWithSize:CGSizeMake(100000, 0) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    return frame.size.width;
}


@end
