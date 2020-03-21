//
//  BottomOutVC.m
//  UI_Demo
//
//  Created by nyl on 2020/3/11.
//  Copyright © 2020 nieyinlong. All rights reserved.
//

#import "BottomOutVC.h"
#import "MaskPopView.h"
#import "UIView+ShowModalView.h"

@interface BottomOutVC ()

@property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, strong) MaskPopView *popView;

@end

@implementation BottomOutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    btn.frame = CGRectMake(100, 100, 200, 40);
    [btn setTitle:@"弹出" forState:(UIControlStateNormal)];
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(popClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
}

- (void)popClick {
    [self.popView show];
}

- (MaskPopView *)popView {
    if (!_popView) {
        _popView = [[MaskPopView alloc] init];
    }
    return _popView;
}

@end
