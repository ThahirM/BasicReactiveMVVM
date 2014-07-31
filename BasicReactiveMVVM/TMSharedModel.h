//
//  TMModel.h
//  BasicReactiveMVVM
//
//  Created by Thahir on 31/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMSharedModel : NSObject
@property (nonatomic, readonly) TMSharedModel *serviceProvider;
+ (instancetype)sharedInstance;
- (void)doLoginWithParams:(id)params completionBlock:(void(^)(id result))completionBlock;
@end
