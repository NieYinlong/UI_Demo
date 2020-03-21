//
//  DCTagMaker.h
//  UI_Demo
//
//  Created by nyl on 2018/6/21.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    DCTagAlignmentLeft = 0,
    DCTagAlignmentCenter = 1,
    DCTagAlignmentRight = 2,
} DCTagAlignment;

@interface DCTagMaker : NSObject

//标签边框
@property (nonatomic) CGFloat strokeWidth;

//标签边框颜色
@property (nullable, nonatomic, strong) UIColor *strokeColor;

//路径的连接点形状,] kCGLineJoinMiter(默认全部连接),kCGLineJoinRound(圆形连接),kCGLineJoinBevel(斜角连接)
@property (nonatomic) CGLineJoin lineJoin;

//标签内容内边距
@property (nonatomic) UIEdgeInsets insets;

//标签圆角
@property (nonatomic) CGFloat cornerRadius;

//标签填充颜色
@property (nullable, nonatomic, strong) UIColor *fillColor;

//字体大小
@property (nonatomic,strong) UIFont * _Nullable font;

//字体颜色
@property (nonatomic,strong) UIColor * _Nonnull textColor;

//标签上下间距
@property (nonatomic,assign) CGFloat lineSpace;

//标签左右间距
@property (nonatomic,assign) CGFloat space;

//标签的最大宽度-》以便计算高度
@property (nonatomic,assign) CGFloat maxWidth;

//对齐方式
@property (nonatomic,assign) DCTagAlignment tagAlignment;

@end

