//
//  AutoInit.h
//  NSObject-AutoPropertyInit
//
//  Created by Perzanowski Piotr on 31/05/14.
//  Copyright (c) 2014 Piotr Perzanowski. All rights reserved.
//
//  Email:  mailto:p.m.perzanowski@gmail.com
//  Github: https://github.com/pegan/AutoPropertyInit
//

#import <Foundation/Foundation.h>

@interface AutoInit : NSObject
@property (readwrite, copy, nonatomic) NSString *property1;
@property (readwrite, strong, nonatomic) NSMutableArray *property2;
@property (readwrite, strong, nonatomic) NSMutableDictionary *property3;
@property (readwrite, strong, nonatomic) NSNumber *property4;
@property (readwrite, strong, nonatomic) NSSet *property5;
@property (readwrite, strong, nonatomic) NSDateFormatter *property6;
@end
