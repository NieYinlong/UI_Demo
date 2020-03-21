//
//  XGTagView.m
//  UI_Demo
//
//  Created by nyl on 2018/6/13.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "XGTagView.h"
#import "TagModel.h"



@interface XGTagView()

@end

@implementation XGTagView

/**
 *  初始化
 *
 *  @param frame    frame
 *  @param tagArray 标签数组
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame tagArray:(NSArray*)tagArray{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _tagArray = tagArray;
        [self setUp];
        [self createTagButton];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}




// 初始化
- (void)setUp{
    
    // 默认颜色
    _textColorNormal = [UIColor darkGrayColor];
    _textColorSelected = [UIColor whiteColor];
    _backgroundColorSelected = [UIColor redColor];
    _backgroundColorNormal = [UIColor whiteColor];
    
    
}

- (void)setIsCanSelect:(BOOL)isCanSelect {
    _isCanSelect = isCanSelect;
    for (int i = 0; i < _tagArray.count; i++) {
        UIButton *btn = [self viewWithTag:100+i];
        btn.userInteractionEnabled = _isCanSelect;
    }
}

// 重写set属性
- (void)setTagArray:(NSMutableArray *)tagArray{
    
    _tagArray = tagArray;
    // 重新创建标签
    [self resetTagButton];
}

- (void)setTextColorSelected:(UIColor *)textColorSelected{
    
    _textColorSelected = textColorSelected;
    // 重新创建标签
    [self resetTagButton];
}

- (void)setTextColorNormal:(UIColor *)textColorNormal{
    
    _textColorNormal = textColorNormal;
    // 重新创建标签
    [self resetTagButton];
}

- (void)setBackgroundColorSelected:(UIColor *)backgroundColorSelected{
    
    _backgroundColorSelected = backgroundColorSelected;
    // 重新创建标签
    [self resetTagButton];
}

- (void)setBackgroundColorNormal:(UIColor *)backgroundColorNormal{
    
    _backgroundColorNormal = backgroundColorNormal;
    // 重新创建标签
    [self resetTagButton];
}

#pragma mark - Private

// 重新创建标签
- (void)resetTagButton{
    
    // 移除之前的标签
    for (UIButton* btn  in self.subviews) {
        [btn removeFromSuperview];
    }
    // 重新创建标签
    [self createTagButton];
}

// 创建标签按钮
- (void)createTagButton{
    
    // 按钮高度
    CGFloat btnH = 28;
    // 距离左边距
    CGFloat leftX = 6;
    // 距离上边距
    CGFloat topY = 10;
    // 按钮左右间隙
    CGFloat marginX = 10;
    // 按钮上下间隙
    CGFloat marginY = 10;
    // 文字左右间隙
    CGFloat fontMargin = 10;
    int hIndex = 1;
    for (int i = 0; i < _tagArray.count; i++) {
        
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100+ marginX + leftX, topY, 100, btnH);
        btn.tag = 100+i;
        // 默认选中第一个
        //        if (i == 0) {
        //            btn.selected = YES;
        //        }
        
        TagModel *model = _tagArray[i];
        
        // 按钮文字
        //[btn setTitle:_tagArray[i] forState:UIControlStateNormal];
        [btn setTitle:model.value forState:UIControlStateNormal];
        
        //------ 默认样式
        //按钮文字默认样式
        NSMutableAttributedString* btnDefaultAttr = [[NSMutableAttributedString alloc]initWithString:btn.titleLabel.text];
        // 文字大小
        [btnDefaultAttr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, btn.titleLabel.text.length)];
        // 默认颜色
        [btnDefaultAttr addAttribute:NSForegroundColorAttributeName value:self.textColorNormal range:NSMakeRange(0, btn.titleLabel.text.length)];
        [btn setAttributedTitle:btnDefaultAttr forState:UIControlStateNormal];
        
        // 默认背景颜色
        [btn setBackgroundImage:[self imageWithColor:self.backgroundColorNormal] forState:UIControlStateNormal];
        
        //-----  选中样式
        // 选中字体颜色
        NSMutableAttributedString* btnSelectedAttr = [[NSMutableAttributedString alloc]initWithString:btn.titleLabel.text];
        // 选中颜色
        [btnSelectedAttr addAttribute:NSForegroundColorAttributeName value:self.textColorSelected range:NSMakeRange(0, btn.titleLabel.text.length)];
        // 选中文字大小
        [btnSelectedAttr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, btn.titleLabel.text.length)];
        [btn setAttributedTitle:btnSelectedAttr forState:UIControlStateSelected];
        
        // 选中背景颜色
        [btn setBackgroundImage:[self imageWithColor:self.backgroundColorSelected] forState:UIControlStateSelected];
        
        // 圆角
        btn.layer.cornerRadius = btn.frame.size.height / 2.f;
        btn.layer.masksToBounds = YES;
        // 边框
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth = 0.5;
        
        // 设置按钮的边距、间隙
        [self setTagButtonMargin:btn fontMargin:fontMargin];
        
        // 处理换行
        if (btn.frame.origin.x + btn.frame.size.width + marginX > self.frame.size.width) {
            _isChangeLine = YES;
            hIndex += 1;
            model.isChangeLine = YES;
            
            if (_reloaBlock) {
                _reloaBlock();
            }
            
            if (hIndex > _rowHright) {
                break;
            }
           
            
            
            // 换行
            topY += btnH + marginY;
            
            // 重置
            leftX = 6;
            btn.frame = CGRectMake(100+ marginX + leftX, topY, 100, btnH);
            
            // 设置按钮的边距、间隙
            [self setTagButtonMargin:btn fontMargin:fontMargin];
            if (_delegate && [_delegate respondsToSelector:@selector(changLine)]) {
                [_delegate changLine];
            }
            
            
        }
        
        // 重置高度
        CGRect frame = btn.frame;
        frame.size.height = btnH;
        btn.frame = frame;
        if (i == _tagArray.count - 1) {
            NSLog(@"frame.origin.y + btnH => %f", frame.origin.y + btnH);
            
            __weak typeof(self) weakSelf = self;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (weakSelf.lastBtnBottomBlock) {
                    weakSelf.lastBtnBottomBlock(frame.origin.y + btnH + marginY);
                }
                
                if (weakSelf.delegate ) {
                    [weakSelf.delegate getLastBtnBottom:frame.origin.y + btnH + marginY];
                }
            });
            
            
        }
        //----- 选中事件
        [btn addTarget:self action:@selector(selectdButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        leftX += btn.frame.size.width + marginX;
    }
    
    // 检测按钮状态，最少选中一个
    [self checkButtonState];
}

// 设置按钮的边距、间隙
- (void)setTagButtonMargin:(UIButton*)btn fontMargin:(CGFloat)fontMargin{
    
    // 按钮自适应
    [btn sizeToFit];
    
    // 重新计算按钮文字左右间隙
    CGRect frame = btn.frame;
    frame.size.width += fontMargin*2;
    btn.frame = frame;
}

// 检测按钮状态，最少选中一个
- (void)checkButtonState{
    return;
    int selectCount = 0;
    UIButton* selectedBtn = nil;
    for(int i=0;i < _tagArray.count; i++){
        UIButton* btn = (UIButton*)[self viewWithTag:100+i];
        if(btn.selected){
            selectCount++;
            selectedBtn = btn;
        }
    }
    if (selectCount == 1) {
        // 只有一个就把这一个给禁用手势
        selectedBtn.userInteractionEnabled = NO;
    }else{
        // 解除禁用手势
        for(int i=0;i < _tagArray.count; i++){
            UIButton* btn = (UIButton*)[self viewWithTag:100+i];
            if(!btn.userInteractionEnabled){
                btn.userInteractionEnabled = YES;
            }
        }
    }
}

// 根据颜色生成UIImage
- (UIImage*)imageWithColor:(UIColor*)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开始画图的上下文
    UIGraphicsBeginImageContext(rect.size);
    
    // 设置背景颜色
    [color set];
    // 设置填充区域
    UIRectFill(CGRectMake(0, 0, rect.size.width, rect.size.height));
    
    // 返回UIImage
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - Event

// 标签按钮点击事件
- (void)selectdButton:(UIButton*)btn{
    if (_isSingleSelection) {
        for (int i = 0; i < _tagArray.count; i++) {
            UIButton *aBtn = [self viewWithTag:100 + i];
            aBtn.selected = NO;
        }
        
    }
    btn.selected = !btn.selected;
    // 检测按钮状态，最少选中一个
    //[self checkButtonState];
}


@end

