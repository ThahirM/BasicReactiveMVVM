//
//  TMSearchViewModel.h
//  BasicReactiveMVVM
//
//  Created by Thahir on 24/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMSearchViewModel : NSObject

@property (nonatomic, strong) NSString *searchText;
@property (nonatomic, strong) NSMutableArray *searchResults;

@property (nonatomic, strong) RACCommand *executeSearch;
@property (nonatomic, strong) RACSignal *executeSearchCompletionSignal;

@end
