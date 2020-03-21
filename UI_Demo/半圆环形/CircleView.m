//
//  CircleView.m
//  UI_Demo
//
//  Created by nyl on 2018/9/17.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *backBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(kScreenWidth/2, kScreenHeight/2) radius:kScreenWidth *3/1 startAngle:kDegreesToRadians(180) endAngle:kDegreesToRadians(0) clockwise:YES];
    
    [[UIColor redColor] set];
    [backBezierPath fill];
}

- (void)draw {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setNeedsDisplay];
}

@end
