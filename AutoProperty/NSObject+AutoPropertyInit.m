//
//  NSObject+AutoPropertyInit.m
//  NSObject-AutoPropertyInit
//
//  Created by Perzanowski Piotr on 31/05/14.
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

#import "NSObject+AutoPropertyInit.h"
#import <objc/runtime.h>

@implementation NSObject (AutoPropertyInit)

- (void)pp_autoPropertyInit
{
    unsigned int propertiesCount;
    objc_property_t *classProperties = class_copyPropertyList([self class], &propertiesCount);
    
    for (NSUInteger i = 0; i < propertiesCount; i++) {
        const char *propertyName = property_getName(classProperties[i]);
        NSString *propertyNameAsString = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        
        objc_property_t property = class_getProperty([self class], propertyName);
        const char *attributes = property_getAttributes(property);
        
        BOOL readwriteObjectType = ([self isObjectType:attributes] && [self isReadwrite:attributes]);
        if (readwriteObjectType) {
            NSString *attributesAsString = [NSString stringWithUTF8String:attributes];
            [self initializeProperty:propertyNameAsString attributes:attributesAsString];
        }
    }
    
    free(classProperties);
}

#pragma mark - Private methods

- (BOOL)isObjectType:(const char *)attributes {
    const char type = attributes[1];
    NSString *typeAttribute = [NSString stringWithFormat:@"%c", type];
    const char *propertyType = [typeAttribute UTF8String];
    
    if (strcmp(propertyType, @encode(NSObject *)) == 0) {
        return YES;
    }
    return NO;
}

- (BOOL)isReadwrite:(const char *)attributes {
    return (strchr(attributes, 'R')) ? NO : YES;
}

- (void)initializeProperty:(NSString *)propertyNameAsString attributes:(NSString *)attributesAsString {
    NSArray *attributesAsArray = [attributesAsString componentsSeparatedByString:@","];
    NSString *propertyClassAsString = (attributesAsArray.count) ? [NSString stringWithFormat:@"%@", [attributesAsArray firstObject]] : @"";
    
    @try {propertyClassAsString = [propertyClassAsString substringWithRange:NSMakeRange(3, propertyClassAsString.length-4)];}
    @catch (NSException * __unused exception) {}
    
    Class propertyClass = NSClassFromString(propertyClassAsString);
    id property = nil;
    
    if ([NSStringFromClass(propertyClass) isEqualToString:@"NSNumber"]) {
        property = [[NSNumber alloc] initWithInteger:0];
        [self setValue:property forKey:propertyNameAsString];
    }
    else if ([NSStringFromClass(propertyClass) isEqualToString:@"NSAttributedString"]) {
        property = [[NSAttributedString alloc] initWithString:@""];
        [self setValue:property forKey:propertyNameAsString];
    }
    else {
        property = [[propertyClass alloc] init];
        [self setValue:property forKey:propertyNameAsString];
    }
    
    NSAssert(property, @"Class %@ is not suported with NSObject+AutoPropertyInit.", propertyClass);
}

@end
