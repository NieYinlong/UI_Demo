//
//  WeightItemView.m
//  UI_Demo
//
//  Created by nyl on 2018/6/4.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "WeightItemView.h"

@implementation WeightItemView



- (void)drawRect:(CGRect)rect {
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    CGFloat width = self.bounds.size.width;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, width, 0);
    CGContextAddLineToPoint(context, width-30, 40);
    CGContextAddLineToPoint(context, 0, 40);
    CGContextAddLineToPoint(context, 0, 0);
   
    //CGContextSetShadow(context, CGSizeMake(width+10, 10), 20);
    CGContextSetShadowWithColor(context, CGSizeMake(width+10, 10), 20, [UIColor blackColor].CGColor);
    
    CGContextSetFillColorWithColor(context, _selColor.CGColor);
    CGContextFillPath(context);
    
    CGContextStrokePath(context);
    
    CGContextClosePath(context);
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView {

    _itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 40)];
    _itemLabel.textColor = [UIColor whiteColor];
    [self addSubview:_itemLabel];
    
}



@end
