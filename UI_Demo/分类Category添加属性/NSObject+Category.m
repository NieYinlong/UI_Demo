//
//  NSObject+Category.m
//  UI_Demo
//
//  Created by nyl on 2018/7/24.
//  Copyright © 2018年 nieyinlong. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

static const char downLoadURLKey;

@interface NSObject()

@property (nonatomic, strong) NSString *downLoadURL;

@end

@implementation NSObject (Category)


- (void)setDownLoadURL:(NSString *)downLoadURL {
    
    // 下面2种写法相等
    //objc_setAssociatedObject(self, @selector(downLoadURL), downLoadURL, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, &downLoadURLKey, downLoadURL, OBJC_ASSOCIATION_RETAIN);
}


- (NSString *)downLoadURL{
    // 下面2种写法相等
    //return objc_getAssociatedObject(self, @selector(downLoadURL));
    return objc_getAssociatedObject(self, &downLoadURLKey);
}

@end
