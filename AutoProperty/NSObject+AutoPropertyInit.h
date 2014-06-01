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
 */

#import <Foundation/Foundation.h>

@interface NSObject (AutoPropertyInit)
/** @brief Initialise the class property with @encode type '@' (NSObject subclass) */
- (void)pp_autoPropertyInit;
@end
