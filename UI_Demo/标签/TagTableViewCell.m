//
//  TagTableViewCell.m
//  UI_Demo
//
//  Created by nyl on 2018/6/13.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "TagTableViewCell.h"
#import <Masonry.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface TagTableViewCell()<XGTagViewDelegate>

@property (nonatomic, strong) UILabel *topLB;
@property (nonatomic, strong) UILabel *bottomLB;

@end
@implementation TagTableViewCell

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
    
    _topLB = [[UILabel alloc] init];
    [self.contentView addSubview:_topLB];
    _topLB.text = @"            活动结束卡了和东福金坷垃";
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(10);
        make.height.mas_equalTo(20);
    }];
  
    
    
    _tView = [[XGTagView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 50)];
    _tView.backgroundColor = [UIColor redColor];
    _tView.isCanSelect = YES;
    _tView.delegate = self;
    _tView.rowHright = 2;
    _tView.backgroundColorSelected = [UIColor blueColor];
    [self.contentView addSubview:_tView];
    [_tView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topLB.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(50);
    }];
    

    _bottomLB = [[UILabel alloc] init];
    [self.contentView addSubview:_bottomLB];
    _bottomLB.backgroundColor = [UIColor greenColor];
    _bottomLB.text = @"          底部部部部部部部部部部部部";
    [_bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tView.mas_bottom).offset(0);
        make.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(20);
        make.bottom.equalTo(self.contentView).offset(0);
    }];
}
- (void)getLastBtnBottom:(CGFloat)bottom {
    self.cellHeight = bottom + 100;
//
    [_tView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(bottom);
    }];
     //_tView.frame = CGRectMake(0, 40, SCREEN_WIDTH, bottom);
}
- (void)changLine {
    
    NSLog(@"换行了✅");
    self.cellHeight = 100 + 100;
    
    [_tView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
    }];
    
   //_tView.frame = CGRectMake(0, 40, SCREEN_WIDTH, 50 * _tView.rowHright);
}

- (void)notChangLine {
//    [_tView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(50);
//    }];
    //_tView.frame = CGRectMake(0, 40, SCREEN_WIDTH, 50);
}


- (void)setTagArr:(NSArray *)tagArr {
    _tagArr = tagArr;
    if (_tView) {
        [_tView removeFromSuperview];
    }
    _tView = [[XGTagView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 50)];
    _tView.backgroundColor = [UIColor redColor];
    _tView.isCanSelect = YES;
    _tView.delegate = self;
    _tView.rowHright = 2;
    _tView.backgroundColorSelected = [UIColor blueColor];
    [self.contentView addSubview:_tView];
    [_tView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topLB.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(50);
    }];
    
    _tView.tagArray = tagArr;
}

@end


