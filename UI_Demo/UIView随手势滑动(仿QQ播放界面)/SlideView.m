//
//  SlideView.m
//  UI_Demo
//
//  Created by nyl on 2020/3/19.
//  Copyright © 2020 nieyinlong. All rights reserved.
//

#import "SlideView.h"

@interface SlideView()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation SlideView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
        
        UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGes:)];
        [self addGestureRecognizer:ges];
    }
    return self;
}

- (void)initView {
    
    self.backgroundColor = [UIColor grayColor];
    
    _btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [_btn setTitle:@"收回⇓" forState:(UIControlStateNormal)];
    [_btn setBackgroundColor:[UIColor whiteColor]];
    [_btn addTarget:self action:@selector(hideClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_btn];
    
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(90);
        make.left.mas_equalTo(24);
    }];
    
    // TODO: 继续布局你想要的界面
}

- (void)handlePanGes:(UIPanGestureRecognizer *)panGes {
    if (panGes.state == UIGestureRecognizerStateChanged) {
        CGPoint location = [panGes locationInView:self];
        if (location.y < 0 || location.y > self.bounds.size.height) {
            return;
        }
        CGPoint translation = [panGes translationInView:self];
        NSLog(@"当前视图在View的位置:%@----平移位置:%@",NSStringFromCGPoint(location),NSStringFromCGPoint(translation));
        //panGes.view.center = CGPointMake(recognizer.view.center.x + translation.x,recognizer.view.center.y + translation.y);
        // 这里kScreenWidth / 2 写死, 就一直靠左
        panGes.view.center = CGPointMake(kScreenWidth / 2, panGes.view.center.y + translation.y);
        [panGes setTranslation:CGPointZero inView:self];
    }
    else if (panGes.state == UIGestureRecognizerStateEnded || panGes.state == UIGestureRecognizerStateCancelled) {
        CGPoint speed = [panGes velocityInView:panGes.view];
        NSLog(@"滑动速度:%@", NSStringFromCGPoint(speed));
        if (speed.y > 600) {
            [self takeBackWithDuration:0.1];
        } else if(speed.y < -600) {
            [self popUpWithDuration:0.1];
        }
        if (self.frame.origin.y > kScreenHeight / 2) {
            [self takeBackWithDuration:0.3];
        } else {
            [self popUpWithDuration:0.3];
        }
    }
}

- (void)popUpWithDuration:(NSTimeInterval)duration {
    if (!self.superview) {
        // 加在window上
        [[UIApplication sharedApplication].delegate.window addSubview:self];
    }
    CGRect frame = self.frame;
      frame.origin.y = 0;
      [UIView animateWithDuration:duration animations:^{
          self.frame = frame;
      }];
}

- (void)takeBackWithDuration:(NSTimeInterval)duration {
    CGRect frame = self.frame;
    frame.origin.y = kScreenHeight;
    [UIView animateWithDuration:duration animations:^{
        self.frame = frame;
    }];
}

- (void)hideClick {
    [self takeBackWithDuration:0.3];
}

@end
