//
//  AutoInit.m
//  NSObject-AutoPropertyInit
//
//  Created by Perzanowski Piotr on 31/05/14.
//  Copyright (c) 2014 Piotr Perzanowski. All rights reserved.
//
//  Email:  mailto:p.m.perzanowski@gmail.com
//  Github: https://github.com/pegan/AutoPropertyInit
//

#import "AutoInit.h"
#import "NSObject+AutoPropertyInit.h"
#import <objc/runtime.h>

@implementation AutoInit

- (instancetype)init {
    self = [super init];
    if (self) {
        [self pp_autoPropertyInit];
    }
    return self;
}

#pragma mark -

- (NSString *)description {
    NSMutableString *desc = [NSMutableString string];
    for (NSInteger i = 1; i <= [self numberOfProperties]; i++) {
        NSString *value = [self valueForKey:[NSString stringWithFormat:@"property%ld", (long)i]];
        [desc appendString:[NSString stringWithFormat:@"\n an object is = %@", value]];
    }
    return desc;
}

- (unsigned int)numberOfProperties {
    unsigned int propertiesCount;
    objc_property_t __unused *classProperties = class_copyPropertyList([self class], &propertiesCount);
    return propertiesCount;
}

@end
