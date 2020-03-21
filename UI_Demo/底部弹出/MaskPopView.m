//
//  MaskPopView.m
//  UI_Demo
//
//  Created by nyl on 2020/3/11.
//  Copyright © 2020 nieyinlong. All rights reserved.
//

#import "MaskPopView.h"

#define kAppWindow [UIApplication sharedApplication].delegate.window

@interface MaskPopView()

@property (nonatomic, strong) UIView *whiteView;

@end

@implementation MaskPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = kAppWindow.bounds;
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagGes)];
        [self addGestureRecognizer:tapGes];
    }
    return self;
}

- (void)tagGes {
    [self hide];
}

- (void)show {
    [kAppWindow addSubview:self];
    [kAppWindow addSubview:self.whiteView];

    CGRect frame = self.whiteView.frame;
    frame.origin.y = kScreenHeight / 2;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.7;
        self.whiteView.frame = frame;
    } completion:^(BOOL finished) {

    }];
}
- (void)hide {
    CGRect frame = self.whiteView.frame;
    frame.origin.y = kScreenHeight;
    [UIView animateWithDuration:0.3 animations:^{
        self.whiteView.frame =  frame;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
         [self.whiteView removeFromSuperview];
    }];
}



- (UIView *)whiteView {
    if (!_whiteView) {
        _whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight / 2)];
        _whiteView.backgroundColor = [UIColor whiteColor];
        _whiteView.layer.cornerRadius = 8;
    }
    return _whiteView;
}

@end
