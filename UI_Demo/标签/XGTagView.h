//
//  XGTagView.h
//  UI_Demo
//
//  Created by nyl on 2018/6/13.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XGTagViewDelegate <NSObject>
- (void)getLastBtnBottom:(CGFloat)bottom;

- (void)changLine;
- (void)notChangLine;

@end

@interface XGTagView : UIView

/**
 *  初始化
 *
 *  @param frame    frame
 *  @param tagArray 标签数组
 *
 *  @return self
 */
- (instancetype)initWithFrame:(CGRect)frame tagArray:(NSMutableArray*)tagArray;

// 标签数组
@property (nonatomic,retain) NSArray* tagArray;

// 选中标签文字颜色
@property (nonatomic,retain) UIColor* textColorSelected;
// 默认标签文字颜色
@property (nonatomic,retain) UIColor* textColorNormal;

// 选中标签背景颜色
@property (nonatomic,retain) UIColor* backgroundColorSelected;
// 默认标签背景颜色
@property (nonatomic,retain) UIColor* backgroundColorNormal;

// 显示几行
@property (nonatomic,assign) int rowHright;

@property (nonatomic, copy) void(^lastBtnBottomBlock)(CGFloat lastBtnBottom);

@property (nonatomic, assign) id<XGTagViewDelegate> delegate;

/** 能否点击*/
@property (nonatomic, assign) BOOL isCanSelect;
/** 是否单选 YES单选 NO多选*/
@property (nonatomic, assign) BOOL isSingleSelection;

@property (nonatomic, assign) BOOL isChangeLine;

@property (nonatomic, copy) void(^reloaBlock)(void);

@end

