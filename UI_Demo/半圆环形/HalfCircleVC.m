//
//  HalfCircleVC.m
//  UI_Demo
//
//  Created by nyl on 2018/9/17.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "HalfCircleVC.h"
#import "CircleView.h"



@interface HalfCircleVC ()

@end

@implementation HalfCircleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGFloat radius = 140;

    UIBezierPath *backBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(kScreenWidth/2, kScreenHeight/2) radius:radius startAngle:kDegreesToRadians(180) endAngle:0 clockwise:YES];
    //startAngle :左侧起点
   
    CAShapeLayer *backShapeLayer = [CAShapeLayer layer];
    backShapeLayer.path = backBezierPath.CGPath;
    backShapeLayer.lineWidth = 50;
    backShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    backShapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:backShapeLayer];
    
    
    NSArray *colors = @[[UIColor greenColor],
                        [UIColor blueColor],
                        [UIColor redColor],
                        [UIColor yellowColor],
                        [UIColor purpleColor],
                        [UIColor brownColor]];
    
    CGFloat aPercent = 180 / colors.count;
    
    for (int i = 0; i < colors.count; i++) {
        
        CGFloat startAngle = i * kDegreesToRadians(aPercent) + kDegreesToRadians(180);
        CGFloat endAngle = startAngle + kDegreesToRadians(aPercent);
        
        UIBezierPath *blueBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(kScreenWidth/2, kScreenHeight/2/* + 2*/) radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        CAShapeLayer *blueLayer = [CAShapeLayer layer];
        blueLayer.path = blueBezierPath.CGPath;
        blueLayer.lineWidth = 40;
        UIColor *aColor = colors[i];
        blueLayer.strokeColor = aColor.CGColor;
        blueLayer.fillColor = [UIColor clearColor].CGColor;
        [self.view.layer addSublayer:blueLayer];
    }
    
    
    // 指针
//    UIImageView *arrowImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0+50, kScreenHeight/2, radius * 2, 1)];
    
    UIImageView *arrowImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    arrowImageV.backgroundColor = [UIColor blackColor];
    [self.view addSubview:arrowImageV];
    
//    [UIView animateWithDuration:3 animations:^{
//
//        arrowImageV.transform = CGAffineTransformRotate(arrowImageV.transform, kDegreesToRadians(0) + kDegreesToRadians(30));
//    }];
    

    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    //设置动画属性，因为是沿着贝塞尔曲线动，所以要设置为position
    animation.keyPath = @"position";
    //设置动画时间
    animation.duration = 2;
    // 告诉在动画结束的时候不要移除
    animation.removedOnCompletion = NO;
    // 始终保持最新的效果
    animation.fillMode = kCAFillModeForwards;
    //贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(kScreenWidth/2, kScreenHeight/2) radius:radius startAngle:kDegreesToRadians(180) endAngle:kDegreesToRadians(180) + kDegreesToRadians(120) clockwise:true];
    // 设置贝塞尔曲线路径
    animation.path = backBezierPath.CGPath;
    
    // 将动画对象添加到视图的layer上
    [arrowImageV.layer addAnimation:animation forKey:nil];
   
    
    
    
    
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
