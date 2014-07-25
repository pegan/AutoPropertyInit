# AutoPropertyInit

AutoPropertyInit is an NSObject category that simplifies the process of initialize properties that are subclasses of NSObject.

## Overview

`- (void)pp_autoPropertyInit` initializes all object properties for that class. For instance NSString property returns an initialized NSString object that contains no characters. NSArray initializes a newly allocated array and so on.

## Example usage

Directly in the designated initializer for the class. It is useful for e.g. in data parser, otherwise is better to use lazy loading.

``` objective-c
#import "AutoInit.h"
#import "NSObject+AutoPropertyInit.h"

@implementation AutoInit

- (instancetype)init {
    self = [super init];
    if (self) {
        [self pp_autoPropertyInit];
    }
    return self;
}

@end
```

After object creating.


``` objective-c

@interface MyClass : NSObject
@property (readwrite, strong, nonatomic) NSMutableArray *array;
@property (readwrite, strong, nonatomic) NSMutableDictionary *dictionary;
@end

@implementation MyClass
- (void)myMethod {
	MyClass *noAutoInit = [[MyClass alloc] init];
	[noAutoInit pp_autoPropertyInit];
	noAutoInit.array[0] = @"Some text";
	noAutoInit.dictionary[@"key"] = @"value";
}
@end
```

## Contact

Piotr Perznowski

- https://github.com/pegan/AutoPropertyInit
- p.m.perzanowski@gmail.com

## License

NSObject-AutoPropertyInit is available under the MIT license. See the `LICENSE` file for more info.
