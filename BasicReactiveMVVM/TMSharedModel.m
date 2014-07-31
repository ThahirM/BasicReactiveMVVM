//
//  TMModel.m
//  BasicReactiveMVVM
//
//  Created by Thahir on 31/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import "TMSharedModel.h"
#import "TMTvinciModel.h"

@interface TMSharedModel () {
    TMTvinciModel *currentProvider;
}
@end

@implementation TMSharedModel

- (TMSharedModel *)serviceProvider {
    if (!currentProvider) {
        currentProvider = [TMTvinciModel new];
    }
    return currentProvider;
}

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)doLoginWithParams:(id)params completionBlock:(void (^)(id))completionBlock {
    // common login goes here
}

@end
