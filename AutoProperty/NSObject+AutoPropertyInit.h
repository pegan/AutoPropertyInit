//
//  NSObject+AutoPropertyInit.h
//  NSObject-AutoPropertyInit
//
// Copyright (c) 2014, Piotr Perzanowski (https://github.com/pegan/AutoPropertyInit)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
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
