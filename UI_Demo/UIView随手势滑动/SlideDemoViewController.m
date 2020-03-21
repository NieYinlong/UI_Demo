//
//  SlideDemoViewController.m
//  UI_Demo
//
//  Created by nyl on 2020/3/21.
//  Copyright © 2020 nieyinlong. All rights reserved.
//

#import "SlideDemoViewController.h"
#import "SlideView.h"

@interface SlideDemoViewController ()

@property (nonatomic, strong) SlideView *slideView;

@end

@implementation SlideDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setTitle:@"弹出" forState:(UIControlStateNormal)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(popUpClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    [btn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-43);
        make.left.mas_equalTo(24);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
}

- (void)popUpClick {
    [self.slideView popUpWithDuration:0.3];
}

- (SlideView *)slideView {
    if (!_slideView) {
        // 注意, 默认在屏幕以下布局
        _slideView = [[SlideView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight)];
    }
    return _slideView;
}
@end
