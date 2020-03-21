//
//  SlideView.h
//  UI_Demo
//
//  Created by nyl on 2020/3/19.
//  Copyright © 2020 nieyinlong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlideView : UIView

/// 弹出
/// @param duration 弹出动画时长
- (void)popUpWithDuration:(NSTimeInterval)duration;

/// 收回
/// @param duration 收回动画时长
- (void)takeBackWithDuration:(NSTimeInterval)duration;

@end

NS_ASSUME_NONNULL_END
