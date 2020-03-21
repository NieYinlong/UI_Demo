//
//  DCTagView.m
//  UI_Demo
//
//  Created by nyl on 2018/6/21.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "DCTagView.h"

@implementation DCTagView

-(instancetype)init{
    
    if (self = [super init]) {
        [self initTagView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self initTagView];
    }
    return self;
}

-(void)initTagView{
    
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.displaysAsynchronously = YES;
}

-(void)setTagAttr:(NSMutableAttributedString *)tagAttr{
    
    _tagAttr = tagAttr;
    [self initTagView];
    self.attributedText = _tagAttr;
}



@end
