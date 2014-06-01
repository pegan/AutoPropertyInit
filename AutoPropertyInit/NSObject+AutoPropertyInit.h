//
//  NSObject+AutoPropertyInit.h
//  NSObject-AutoPropertyInit
//
//  Created by Perzanowski Piotr on 31/05/14.
//  Copyright (c) 2014 Piotr Perzanowski. All rights reserved.
//
//  Email:  mailto:p.m.perzanowski@gmail.com
//  Github: https://github.com/pegan/AutoPropertyInit
//

/**
 `AutoPropertyInit` is an `NSObject` category that simplifies the process of initialize properties that are subclasses of `NSObject`.
 
 `- (void)pp_autoPropertyInit` initializes all object properties for that class. For instance NSString property returns an initialized `NSString` object that contains no characters. `NSArray` initializes a newly allocated array and so on.
 
 ## Example usage
 
 Directly in the designated initializer for the class. It is useful for e.g. in data parser, otherwise is better to use lazy loading.
 
    #import "AutoInit.h"
    #import "NSObject+AutoPropertyInit.h"
 
    @implementation AutoInit
    - (instancetype)init {
        self = [ super init ];
        if (self) {
            [self pp_autoPropertyInit];
        }
        return self;
    }
    @end
 
 After object creating.
 
    @interface MyClass : NSObject
    @property (readwrite, strong, nonatomic) NSMutableArray *array;
    @property (readwrite, strong, nonatomic) NSMutableDictionary *dictionary;
    @end
 
    @implementation DoAutoInit
    - (void)myMethod {
        MyClass *noAutoInit = [[ MyClass alloc ] init];
        [noAutoInit pp_autoPropertyInit];
        noAutoInit.array[0] = @"Some text";
        noAutoInit.dictionary[@"key"] = @"value";
    }
    @end
 
 ## Contact
 
 Piotr Perznowski
 
 - https://github.com/pegan/AutoPropertyInit
 - p.m.perzanowski@gmail.com
 
 ## License
 
 NSObject-AutoPropertyInit is available under the BSD 2-Clause license.
 */

#import <Foundation/Foundation.h>

@interface NSObject (AutoPropertyInit)
/** @brief Initialise the class property with @encode type '@' (NSObject subclass) */
- (void)pp_autoPropertyInit;
@end
