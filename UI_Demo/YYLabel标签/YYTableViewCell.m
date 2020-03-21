//
//  YYTableViewCell.m
//  UI_Demo
//
//  Created by nyl on 2018/6/21.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "YYTableViewCell.h"

#import "DCTagView.h"
#import "NSMutableAttributedString+DCTagView.h"
#import "DCTagMaker.h"
#import <Masonry.h>

@interface YYTableViewCell()

@property (nonatomic, strong) DCTagView *tagView;

@end
@implementation YYTableViewCell

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
    
    
    UILabel * topLB = [[UILabel alloc] init];
    [self.contentView addSubview:topLB];
    topLB.text = @"            活动结束卡了和东福金坷垃";
    [topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(10);
        make.height.mas_equalTo(20);
    }];
    
    
    _tagView = [[DCTagView alloc] init];
    _tagView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_tagView];
    [_tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topLB.mas_bottom).offset(10);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
    }];
    
    UILabel * bottomLB = [[UILabel alloc] init];
    [self.contentView addSubview:bottomLB];
    bottomLB.text = @"          底部部部部部部部部部部部部";
    [bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tagView.mas_bottom).offset(0);
        make.left.equalTo(self.contentView).offset(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(20);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    
//    UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGesRecognizer)];
//    longGes.minimumPressDuration = 2;
//    [_tagView addGestureRecognizer:longGes];
}

- (void)longGesRecognizer {
    NSLog(@"长按");
}


- (void)setTagArray:(NSArray *)tagArray {
    

    NSArray<NSString *> *tags = tagArray;
    NSMutableAttributedString *attr = [NSMutableAttributedString dc_makeTagAttributedString: tags tagMaker:^(DCTagMaker *make){
        make.strokeColor = [UIColor redColor];
        make.fillColor = [UIColor greenColor];
        make.strokeWidth = 1;
        make.cornerRadius = 100;
        make.insets =  UIEdgeInsetsMake(-2, -6, -2, -6);
        make.font = [UIFont systemFontOfSize:16];
        make.textColor = [UIColor blackColor];
        make.lineSpace = 10;
        make.space = 10;
        make.maxWidth = [UIScreen mainScreen].bounds.size.width - 100;
        make.tagAlignment = DCTagAlignmentLeft;
    }];
    
    _tagView.tagAttr = attr;
    CGFloat h = [attr getTagHeight];
    /*
     限制高度
    if (h > 65) {
        h = 65;
    }*/
    [_tagView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(h);
    }];
    
    
}




@end
