//
//  DottView.m
//  UI_Demo
//
//  Created by nyl on 2018/6/4.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "DottView.h"

@implementation DottView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {// 可以通过 setNeedsDisplay方法调用 drawRect:

    // Drawing code

    

    CGContextRef context = UIGraphicsGetCurrentContext();

    // 设置线条的样式
    CGContextSetLineCap(context,kCGLineCapSquare);

    // 绘制线的宽度
    CGContextSetLineWidth(context,2.0);

    // 线的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);

    // 开始绘制
    CGContextBeginPath(context);

    // 设置虚线绘制起点
    CGContextMoveToPoint(context,0, 0);

    // lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
    CGFloat lengths[] = {5, 5};

    // 虚线的起始点
    CGContextSetLineDash(context, 5, lengths,2);

    // 绘制虚线的终点
    CGContextAddLineToPoint(context,0, self.bounds.size.height);

    // 绘制
    CGContextStrokePath(context);

    // 关闭图像
    CGContextClosePath(context);
}

//- (void)drawRect:(CGRect)rect {
//
//    self.backgroundColor = [UIColor lightGrayColor];
//
//    CGFloat width = self.bounds.size.width;
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    //画一个菱形
//    CGContextSetLineWidth(context, 2.0);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, width, 0);
//    CGContextAddLineToPoint(context, width-30, 40);
//    CGContextAddLineToPoint(context, 0, 40);
//    CGContextAddLineToPoint(context, 0, 0);
//
//    CGContextSetFillColorWithColor(context, _selColor.CGColor);
//    CGContextFillPath(context);
//
//    CGContextStrokePath(context);
//}

@end
