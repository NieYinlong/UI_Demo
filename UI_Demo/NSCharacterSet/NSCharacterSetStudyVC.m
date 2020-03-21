//
//  NSCharacterSetStudyVC.m
//  UI_Demo
//
//  Created by nyl on 2018/9/6.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "NSCharacterSetStudyVC.h"

@interface NSCharacterSetStudyVC ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *label;

@end

@implementation NSCharacterSetStudyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //https://www.jianshu.com/p/5fb58dc73e7b
    
    _label = [[UILabel alloc] init];
    [self.view addSubview:_label];
    _label.backgroundColor = [UIColor grayColor];
    _label.textColor = [UIColor whiteColor];
    _label.numberOfLines = 0;
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(24);
        make.right.mas_equalTo(-24);
    }];
    
    
    UITextField *textField = [[UITextField alloc] init];
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textField.layer.borderWidth = 1;
    textField.placeholder = @"只能输入数字";
    textField.delegate = self;
    [self.view addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label.mas_bottom).offset(20);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(90);
    }];
    
    
//    //需求： 有一个字符串:@"今天我们来学习NSCharacterSet我们快乐"，去除字符串中所有的@"今"、@"我"。
//    NSString *str1 = @"今天我们来学习NSCharacterSet我们快乐";
//    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"今我"];
//    NSArray *setArray = [str1 componentsSeparatedByCharactersInSet:charSet];
//    NSLog(@"setArray = %@", setArray);
//    NSString *resultStr = [setArray componentsJoinedByString:@""];
//    _label.text = resultStr;
    
    
    // 过滤非纯数字
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSString *sourceStr = @"123sdf5d7h90";
    
    NSString *retStr = [[sourceStr componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@""];
    NSLog(@"retStr = %@", retStr);
    
    //invertedSet 逆集
    NSCharacterSet *invertedSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];

    NSArray *arr = [sourceStr componentsSeparatedByCharactersInSet:invertedSet];
    NSString *retStr2 = [arr componentsJoinedByString:@""];
    NSLog(@"retStr2  %@", retStr2);
    
   
//    retStr = sdfdh
//    retStr2  1235790
//    retStr1 和 retStr2正好相反
    
    
}





#pragma mark - UITextFieldDelegate
// 输入框过滤非纯数字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //invertedSet 逆集
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    
    // 此时过滤掉了非@"0123456789"中的字符
    NSString *filterStr = [[string componentsSeparatedByCharactersInSet:characterSet] componentsJoinedByString:@""];
    
    BOOL isEqual = [filterStr isEqualToString:string];
    
    return isEqual;
}

// 效果同上
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//
//    if ([string isEqualToString:@""]) return YES;
//    unichar c = [string characterAtIndex:0];
//    if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:c]) {
//        return YES;
//    } else {
//        return NO;
//    }
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
