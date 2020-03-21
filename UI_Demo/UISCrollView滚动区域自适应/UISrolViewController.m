//
//  UISrolViewController.m
//  UI_Demo
//
//  Created by nyl on 2018/6/5.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "UISrolViewController.h"
#import <Masonry.h>
#import <AssetsLibrary/AssetsLibrary.h>
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface UISrolViewController ()

@end

@implementation UISrolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
  
    
}

- (void)initView {
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    
    [self.view addSubview:scrollView];
    scrollView.pagingEnabled = YES;
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    UIImageView * container = [[UIImageView alloc] init];
    container.image = [UIImage imageNamed:@"weight_share_bgView"];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.height.equalTo(scrollView); // 左右滑动
        //make.width.equalTo(scrollView); // 上下滑动
    }];
    
    
    UIView * redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [container addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(kScreenWidth);
        
        make.top.mas_equalTo(0);
        make.bottom.equalTo(scrollView).offset(-50);
    }];
    
    UIView * blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [container addSubview:blueView];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
//        make.width.mas_equalTo(kScreenWidth);
        make.left.mas_equalTo(kScreenWidth);
        //make.right.equalTo(container.mas_right);
        make.width.mas_equalTo(kScreenWidth);
        make.bottom.equalTo(scrollView).offset(-50);
        
    }];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        scrollView.contentOffset = CGPointMake(0, 200);
//    });

    
    return;
//    UIImageView * container = [[UIImageView alloc] init];
//    container.image = [UIImage imageNamed:@"weight_share_bgView"];
//    [scrollView addSubview:container];
//
//    [container mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.edges.equalTo(scrollView);
//
//        make.height.equalTo(scrollView); // 左右滑动
//        //make.width.equalTo(scrollView); // 上下滑动
//
//    }];
    
//    UIView * redView = [UIView new];
//    redView.backgroundColor = [UIColor redColor];
//    [container addSubview:redView];
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.equalTo(scrollView);
//        make.width.mas_equalTo(375);
//        //make.top.equalTo(container.mas_top).offset(30);
//        make.top.mas_equalTo(10);
//        //make.height.mas_equalTo(100);
//        make.bottom.equalTo(scrollView).offset(-10);
//
//    }];
//
//    UIView * blueView = [UIView new];
//    blueView.backgroundColor = [UIColor blueColor];
//    [container addSubview:blueView];
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(0);
//        make.width.mas_equalTo(375);
//        make.left.equalTo(redView.mas_right);
//        make.bottom.equalTo(container).offset(-10);
//
//
//    }];
    
//    
//    UIView * yellowView = [UIView new];
//    
//    yellowView.backgroundColor = [UIColor yellowColor];
//    
//    [container addSubview:yellowView];
//    
//    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(blueView.mas_bottom).offset(30);
//        make.left.right.equalTo(scrollView);
//        make.height.mas_equalTo(100);
//        make.bottom.equalTo(container).offset(-40);
//    }];
//    
    
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
