//
//  TagTableViewCell.h
//  UI_Demo
//
//  Created by nyl on 2018/6/13.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XGTagView.h"
@interface TagTableViewCell : UITableViewCell
@property (nonatomic, strong) XGTagView *tView;
@property (nonatomic, copy) void(^reloadBlock)(CGFloat bottom);

@property (nonatomic, assign) CGFloat cellHeight;


@property (nonatomic, copy) void(^reloadTableViewBlock)(void);
@property (nonatomic, strong) NSArray  *tagArr;


@end

