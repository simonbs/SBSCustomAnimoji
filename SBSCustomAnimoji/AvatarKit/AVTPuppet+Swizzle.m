//
//  AVTPuppet+Swizzle.m
//  SBSAnimoji
//
//  Created by Simon Støvring on 28/01/2018.
//  Copyright © 2018 SimonBS. All rights reserved.
//

@import SceneKit;
#import "AVTPuppet.h"
#import "NSObject+Swizzle.h"

@implementation AVTPuppet (Swizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self sbs_swizzleOriginalClassSelector:@selector(pathForPuppetNamed:options:) swizzledClassSelector:@selector(sbs_pathForPuppetNamed:options:)];
    });
}

+ (id)sbs_pathForPuppetNamed:(id)arg1 options:(id)arg2 {
    if ([[self sbs_custom] containsObject:arg1] ) {
        return [[NSBundle mainBundle] pathForResource:arg1 ofType:@"scn"];
    } else {
        return [self sbs_pathForPuppetNamed:arg1 options:arg2];
    }
}

+ (NSArray *)sbs_custom {
    return @[ @"mrsquare" ];
}

@end
