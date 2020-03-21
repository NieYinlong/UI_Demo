//
//  NSMutableAttributedString+DCTagView.m
//  UI_Demo
//
//  Created by nyl on 2018/6/21.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "NSMutableAttributedString+DCTagView.h"
#import <YYText.h>


static NSMutableAttributedString *_text;
static CGFloat _tagHeight;


@implementation NSMutableAttributedString (DCTagView)



+ (NSMutableAttributedString *)dc_makeTagAttributedString:(NSArray<NSString *> *)tags  tagMaker:(void (^)(DCTagMaker *))maskBlock{
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    _text = text;
    
    
    NSInteger height = 0;
    DCTagMaker *maker = [[DCTagMaker alloc] init];
    if (maskBlock) {
        maskBlock(maker);
    }
    for (int i = 0; i < tags.count; i++) {
        NSString *tag = tags[i];
        NSMutableAttributedString *tagText = [[NSMutableAttributedString alloc] init];
        //标签左内边距
        [tagText appendAttributedString:[self creatEmptyAttributeString:fabs(maker.insets.left)]];
        //标签内容
        [tagText yy_appendString:tag];
        //标签右内边距
        [tagText appendAttributedString:[self creatEmptyAttributeString:fabs(maker.insets.right)]];
        //设置外观
        [self beautifyAttributedStringWithText:tagText ranges:NSMakeRange(0, tagText.length) maker:maker];
        //左右间距
        [tagText appendAttributedString:[self creatEmptyAttributeString:maker.space]];
        //行间距等设置
        [text appendAttributedString:tagText];
        text.yy_lineSpacing = maker.lineSpace;
        text.yy_lineBreakMode = NSLineBreakByWordWrapping;
        //高度计算（超最大范围加换行符手动换行）
        YYTextContainer  *tagContarer = [YYTextContainer new];
        tagContarer.size = CGSizeMake(maker.maxWidth - 3,CGFLOAT_MAX);
        YYTextLayout *tagLayout = [YYTextLayout layoutWithContainer:tagContarer text:text];
        if (tagLayout.textBoundingSize.height > height) {
            
            if (height != 0) {
                [text yy_insertString:@"\n" atIndex:text.length - tagText.length];
            }
            
            tagLayout = [YYTextLayout layoutWithContainer:tagContarer text:text];
            height = tagLayout.textBoundingSize.height;
        }
    }
    
    //高度记录（富文本已扩展高度属性）
    //text.tagHeight = height + maker.lineSpace + fabs(maker.insets.top) + fabs(maker.insets.bottom) ;
    
    //高度记录
    _tagHeight = height + maker.lineSpace + fabs(maker.insets.top) + fabs(maker.insets.bottom) ;
    
    //对齐方向设置（头尾自动缩进1.5）
    [text addAttribute:NSParagraphStyleAttributeName value:[self creatTextStyle:maker]
                 range:NSMakeRange(0, text.length)];
    return text;
}

+(void) beautifyAttributedStringWithText:(NSMutableAttributedString * )tagText ranges:(NSRange)range maker:(DCTagMaker *)maker{
    
    //标签字体颜色设置
    tagText.yy_font = maker.font;
    tagText.yy_color = maker.textColor;
    [tagText yy_setTextBinding:[YYTextBinding bindingWithDeleteConfirm:NO] range:tagText.yy_rangeOfAll];
    //设置item外观样式
    [tagText yy_setTextBackgroundBorder:[self creatTextBoard:maker] range:range];
}

/**
 外观样式
 
 @param maker tag外观配置
 @return 返回YYTextBorder
 */
+(YYTextBorder *)creatTextBoard:(DCTagMaker *)maker{
    
    YYTextBorder *border = [YYTextBorder new];
    border.strokeWidth = maker.strokeWidth;
    border.strokeColor = maker.strokeColor;
    border.fillColor = maker.fillColor;
    border.cornerRadius = maker.cornerRadius; // a huge value
    border.lineJoin = maker.lineJoin;
    border.insets = UIEdgeInsetsMake(maker.insets.top, 0, maker.insets.bottom, 0);
    return border;
}

+(NSMutableAttributedString *)creatEmptyAttributeString:(CGFloat)width{
    
    NSMutableAttributedString *spaceText = [NSMutableAttributedString yy_attachmentStringWithContent:[[UIImage alloc]init] contentMode:UIViewContentModeScaleToFill attachmentSize:CGSizeMake(width, 1) alignToFont:[UIFont systemFontOfSize:0] alignment:YYTextVerticalAlignmentCenter];
    return spaceText;
    
}

+(NSMutableParagraphStyle *)creatTextStyle:(DCTagMaker *)maker{
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineSpacing =  maker.lineSpace;
    style.firstLineHeadIndent = 1.5;
    style.headIndent = 1.5 ;//设置与首部的距离
    style.tailIndent = maker.tagAlignment == NSTextAlignmentRight ? maker.maxWidth - fabs(maker.insets.right) : maker.maxWidth - 1.5; //设置与尾部的距离
    switch (maker.tagAlignment) {
        case DCTagAlignmentLeft:
            style.alignment = NSTextAlignmentLeft;
            break;
            
        case DCTagAlignmentCenter:
            style.alignment = NSTextAlignmentCenter;
            break;
            
        case DCTagAlignmentRight:
            style.alignment = NSTextAlignmentRight;
            break;
            
        default:
            break;
    }
    
    return style;
}




- (CGFloat)getTagHeight {
    
    return _tagHeight;
}



@end
