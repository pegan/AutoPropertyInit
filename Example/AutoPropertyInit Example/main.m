//
//  main.m
//  AutoPropertyInit Example
//
//  Created by Perzanowski Piotr on 01/06/14.
//  Copyright (c) 2014 Piotr Perzanowski. All rights reserved.
//
//  Email:  mailto:p.m.perzanowski@gmail.com
//  Github: https://github.com/pegan/AutoPropertyInit
//

#import <Foundation/Foundation.h>
#import "AutoInit.h"
#import "NoAutoInit.h"
#import "NSObject+AutoPropertyInit.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NoAutoInit *noAutoInit = [[NoAutoInit alloc] init];
        NSLog(@"%@\n\n", noAutoInit.description);
        
        NSMutableDictionary *dict1 = noAutoInit.property3;
        dict1[@"key"] = @"value 1";
        NSLog(@"property3 value = %@\n\n", dict1[@"key"]);
        
        // Initialize all properties with a pp_autoPropertyInit method
        [noAutoInit pp_autoPropertyInit];
        NSMutableDictionary *dict2 = noAutoInit.property3;
        dict2[@"key"] = @"value 2";
        NSLog(@"property3 value = %@\n\n", dict2[@"key"]);
        
        NSLog(@"%@\n\n", noAutoInit.description);
        
        AutoInit *autoInit = [[AutoInit alloc] init];
        NSLog(@"%@\n\n", autoInit.description);
        
        NSMutableDictionary *dict3 = autoInit.property3;
        dict3[@"key"] = @"value 3";
        NSLog(@"property3 value = %@\n\n", dict3[@"key"]);
        
    }
    return 0;
}

