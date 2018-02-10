//
//  NSObject+Swizzle.h
//  SBSAnimoji
//
//  Created by Simon Støvring on 10/11/2017.
//  Copyright © 2017 SimonBS. All rights reserved.
//

@interface NSObject (Swizzle)
+ (void)sbs_swizzleOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
+ (void)sbs_swizzleOriginalClassSelector:(SEL)originalSelector swizzledClassSelector:(SEL)swizzledSelector;
@end
