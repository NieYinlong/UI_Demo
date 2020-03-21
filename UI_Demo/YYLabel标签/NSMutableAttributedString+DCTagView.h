//
//  NSMutableAttributedString+DCTagView.h
//  UI_Demo
//
//  Created by nyl on 2018/6/21.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DCTagMaker.h"


@interface NSMutableAttributedString (DCTagView)

/**
 快速创建tag标签所需样式
 
 @param tags 字符串数组
 @param maskBlock 初始化标签样式
 @return 标签所需的NSMutableAttributedString
 */
+(NSMutableAttributedString *)dc_makeTagAttributedString:(NSArray<NSString *> *)tags  tagMaker:(void (^)(DCTagMaker *))maskBlock;

- (CGFloat )getTagHeight;

@end
