//
//  UIView+ShowModalView.m
//  JamBoHealth
//
//  Created by zyh on 15/9/9.
//  Copyright (c) 2015年 zyh. All rights reserved.
//

#import "UIView+ShowModalView.h"
#import <objc/runtime.h>

#define MODAL_BGVIEW_TAG 120307

NSString * const TouchBgNotification = @"TouchBgNotification";
static const char modalViewTagKey;

@interface UIView()

@property (nonatomic, assign) NSInteger modalViewTag;

@end

@implementation UIView (ShowModalView)

- (void)showModalView:(UIView *)modalView
{
    [self showModalView:modalView canDismissByTouchBg:YES];
}

- (void)showModalView:(UIView *)modalView canDismissByTouchBg:(BOOL)bCanDismiss
{
    [self showModalView:modalView doUseOriginFrame:NO canDismissByTouchBg:bCanDismiss];
}

- (void)showModalView:(UIView *)modalView doUseOriginFrame:(BOOL)bUseFrame
{
    [self showModalView:modalView doUseOriginFrame:bUseFrame canDismissByTouchBg:YES];
}

- (void)showNewModalView:(UIView *)modalView doUseOriginFrame:(BOOL)bUseFrame alpha:(CGFloat)alphaNum{
    [self showNewModalView:modalView doUseOriginFrame:bUseFrame canDismissByTouchBg:YES alpha:alphaNum];
}
- (void)showNewModalView:(UIView *)modalView doUseOriginFrame:(BOOL)bUseFrame canDismissByTouchBg:(BOOL)bCanDismiss alpha:(CGFloat)alphaNum{
    [self dismissModalView];
    
    UIView *bgView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [bgView setBackgroundColor:[UIColor clearColor]];
    bgView.tag = MODAL_BGVIEW_TAG;
    [self addSubview:bgView];
    
    UIView *alphaBrotherView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [alphaBrotherView setBackgroundColor:[UIColor blackColor]];
    [alphaBrotherView setAlpha:alphaNum];
    [bgView addSubview:alphaBrotherView];
    
    if (bCanDismiss) {
        UITapGestureRecognizer *bgTapGesture = [[UITapGestureRecognizer alloc] init];
        [bgTapGesture addTarget:self action:@selector(bgTappedToDismiss:)];
        [alphaBrotherView addGestureRecognizer:bgTapGesture];
    }
    
    if (bUseFrame) {
        [bgView addSubview:modalView];
        
    }else {
        CGRect tempFrame = modalView.frame;
        tempFrame.origin.x = (kScreenWidth - tempFrame.size.width)/2;
        tempFrame.origin.y = (kScreenHeight - tempFrame.size.height)/2;
        modalView.frame = tempFrame;
        [bgView addSubview:modalView];
    }

}

- (void)showModalView:(UIView *)modalView doUseOriginFrame:(BOOL)bUseFrame canDismissByTouchBg:(BOOL)bCanDismiss
{
    [self dismissModalView];
    
    UIView *bgView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [bgView setBackgroundColor:[UIColor clearColor]];
    bgView.tag = MODAL_BGVIEW_TAG;
    [self addSubview:bgView];
    
    UIView *alphaBrotherView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [alphaBrotherView setBackgroundColor:[UIColor blackColor]];
    [alphaBrotherView setAlpha:0.7];
    [bgView addSubview:alphaBrotherView];
    
    if (bCanDismiss) {
        UITapGestureRecognizer *bgTapGesture = [[UITapGestureRecognizer alloc] init];
        [bgTapGesture addTarget:self action:@selector(bgTappedToDismiss:)];
        [alphaBrotherView addGestureRecognizer:bgTapGesture];
    }
    
    if (bUseFrame) {
        [bgView addSubview:modalView];
    
    }else {
        CGRect tempFrame = modalView.frame;
        tempFrame.origin.x = (kScreenWidth - tempFrame.size.width)/2;
        tempFrame.origin.y = (kScreenHeight - tempFrame.size.height)/2;
        modalView.frame = tempFrame;
        [bgView addSubview:modalView];
    }
}

- (void)bgTappedToDismiss:(UITapGestureRecognizer *)sender
{
    [self dismissModalView];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TouchBgNotification object:nil];
}

- (void)dismissModalView
{
    UIView *bgView = [self viewWithTag:MODAL_BGVIEW_TAG];
    if (bgView) {
        [bgView removeFromSuperview];
        bgView = nil;
    }
}


@end
