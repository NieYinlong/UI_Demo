//
//  DCTagView.h
//  UI_Demo
//
//  Created by nyl on 2018/6/21.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYText.h>
#import "DCTagMaker.h"

@interface DCTagView : YYLabel

/**
 *NSMutableAttributedString
 */
@property (nonatomic,strong) NSMutableAttributedString * tagAttr;


@end
