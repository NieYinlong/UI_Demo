//
//  MasonryAnimationVC.m
//  UI_Demo
//
//  Created by nyl on 2018/7/28.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "MasonryAnimationVC.h"
#import <Masonry.h>
@interface MasonryAnimationVC ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation MasonryAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    __block NSString *name = @"001";
    dispatch_async(dispatch_get_main_queue(), ^{
        name = @"003";
        NSLog(@"nnn == %@", name);
    });
    
    
    _testView = [[UIView alloc] init];
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
    [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 向右平移100
    [_testView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
    }];
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
