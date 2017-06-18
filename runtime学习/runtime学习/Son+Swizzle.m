//
//  Son+Swizzle.m
//  runtime学习
//
//  Created by qwkj on 2017/6/4.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import "Son+Swizzle.h"
#import <objc/runtime.h>

@implementation Son (Swizzle)

BOOL simple_Swizzle(Class aClass, SEL originalSel,SEL swizzleSel){
    
    Method originalMethod = class_getInstanceMethod(aClass, originalSel);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
    method_exchangeImplementations(originalMethod, swizzleMethod);
    
    return YES;
}
BOOL best_Swizzle(Class aClass, SEL originalSel,SEL swizzleSel){
    
    Method originalMethod = class_getInstanceMethod(aClass, originalSel);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
    BOOL didAddMethod = class_addMethod(aClass, originalSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(aClass, swizzleSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
    
    return YES;
}
+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        

//        simple_Swizzle([self class], NSSelectorFromString(@"work"), @selector(son_work));
    //         best_Swizzle([self class], NSSelectorFromString(@"work"), @selector(son_work));
        
//        best_Swizzle([self class], @selector(cry), @selector(son_Cry));
        best_Swizzle([self class], @selector(cry), @selector(son_Cry));


    });
    
}

-(void)son_work{
    
    [self son_work];
    NSLog(@"son分类里的son_work");
}

-(void)son_Cry{
    NSLog(@"我是son分类,WZ_Cry方法");
    [self son_Cry];
}
@end
