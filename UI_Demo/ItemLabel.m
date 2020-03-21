//
//  ItemLabel.m
//  UI_Demo
//
//  Created by nyl on 2018/6/4.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "ItemLabel.h"

@implementation ItemLabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    CGFloat width = self.bounds.size.width;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //画一个菱形
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, width, 0);
    CGContextAddLineToPoint(context, width-30, 40);
    CGContextAddLineToPoint(context, 0, 40);
    CGContextAddLineToPoint(context, 0, 0);
    
    CGContextSetFillColorWithColor(context, _selColor.CGColor);
    CGContextFillPath(context);
    
    CGContextStrokePath(context);
}






@end
