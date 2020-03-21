//
//  UIView+ShowModalView.h
//  JamBoHealth
//
//  Created by zyh on 15/9/9.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  弹出模态窗口，但是不能重复弹出
 *  弹出新窗口前会移除前一个窗口
 */
extern NSString * const TouchBgNotification;

@interface UIView (ShowModalView)

/** 弹出可通过点击背景消失的模态窗口, 可以点击背景消失*/
- (void)showModalView:(UIView *)modalView;

/** 弹出窗口，指定是否可通过点击背景消失*/
- (void)showModalView:(UIView *)modalView canDismissByTouchBg:(BOOL)bCanDismiss;

/** 使用modalView的frame布局*/
- (void)showModalView:(UIView *)modalView doUseOriginFrame:(BOOL)bUseFrame;

- (void)showNewModalView:(UIView *)modalView doUseOriginFrame:(BOOL)bUseFrame alpha:(CGFloat)alphaNum;


/** 使用modalView的frame布局, 指定是否可通过点击背景消失*/
- (void)showModalView:(UIView *)modalView doUseOriginFrame:(BOOL)bUseFrame canDismissByTouchBg:(BOOL)bCanDismiss;

- (void)showNewModalView:(UIView *)modalView doUseOriginFrame:(BOOL)bUseFrame canDismissByTouchBg:(BOOL)bCanDismiss alpha:(CGFloat)alphaNum;


/** 隐藏模态窗口*/
- (void)dismissModalView;

@end

