//
//  TMTvinciModel.m
//  BasicReactiveMVVM
//
//  Created by Thahir on 31/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import "TMTvinciModel.h"

@implementation TMTvinciModel

- (void)doLoginWithParams:(id)params completionBlock:(void (^)(id))completionBlock {
    [super doLoginWithParams:params completionBlock:completionBlock];
    
    // actual login goes here
    
    // on login
    completionBlock(@[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j"]);
}

@end
