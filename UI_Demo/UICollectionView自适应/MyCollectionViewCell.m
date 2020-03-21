//
//  MyCollectionViewCell.m
//  UI_Demo
//
//  Created by nyl on 2020/3/18.
//  Copyright © 2020 nieyinlong. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    self.contentView.layer.borderColor  = [UIColor yellowColor].CGColor;
    self.contentView.layer.borderWidth = 1;
    
    _nameLB = [[UILabel alloc] init];
    _nameLB.font= [UIFont systemFontOfSize:17];
    _nameLB.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_nameLB];
    [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        //make.centerY.equalTo(self.contentView);
        make.top.mas_equalTo(8);
    }];
}

@end
