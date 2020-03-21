//
//  ExpandCell.m
//  UI_Demo
//
//  Created by nyl on 2018/6/11.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "ExpandCell.h"
#import <Masonry.h>


@implementation ExpandCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _titleLB = [[UILabel alloc] init];
    [self.contentView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(20);
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    
    _detailLB = [[UILabel alloc] init];
    [self.contentView addSubview:_detailLB];
    _detailLB.numberOfLines = 0;
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLB.mas_bottom).offset(20);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.bottom.equalTo(self.contentView).offset(-70);
    }];
    
    
    _seeDetailBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [_seeDetailBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [self.contentView addSubview:_seeDetailBtn];
    [_seeDetailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-20);
        make.height.mas_equalTo(30);
        make.left.right.equalTo(self.contentView);
    }];
    
}




@end
