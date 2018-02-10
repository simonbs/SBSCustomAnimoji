//
//  NSObject+Swizzle.m
//  SBSAnimoji
//
//  Created by Simon Støvring on 10/11/2017.
//  Copyright © 2017 SimonBS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Swizzle)
@end

@implementation NSObject (Swizzle)

+ (void)sbs_swizzleOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    [self sbs_swizzle:class originalSelector:originalSelector originalMethod:originalMethod swizzledSelector:swizzledSelector swizzledMethod:swizzledMethod];
}

+ (void)sbs_swizzleOriginalClassSelector:(SEL)originalSelector swizzledClassSelector:(SEL)swizzledSelector {
    Class class = object_getClass([self class]);
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    [self sbs_swizzle:class originalSelector:originalSelector originalMethod:originalMethod swizzledSelector:swizzledSelector swizzledMethod:swizzledMethod];
}

+ (void)sbs_swizzle:(Class)class originalSelector:(SEL)originalSelector originalMethod:(Method)originalMethod swizzledSelector:(SEL)swizzledSelector swizzledMethod:(Method)swizzledMethod {
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
