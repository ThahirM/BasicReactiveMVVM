//
//  TMSearchViewModel.m
//  BasicReactiveMVVM
//
//  Created by Thahir on 24/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import "TMSearchViewModel.h"
#import "TMSharedModel.h"

@implementation TMSearchViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
    RACSignal *validSearchSignal = [[RACObserve(self, searchText) map:^id(NSString *text) {
        return @(text.length > 3);
    }] distinctUntilChanged];
    
    self.executeSearch = [[RACCommand alloc] initWithEnabled:validSearchSignal signalBlock:^RACSignal *(id input) {
        
        // do the search;
        return [self executeSearchSignal];
    }];
}

- (RACSignal *)executeSearchCompletionSignal {
    return self.executeSearch.completionSignal;
}

- (RACSignal *)executeSearchSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        TMSharedModel *sharedModel = [[TMSharedModel sharedInstance] serviceProvider];
        [sharedModel doLoginWithParams:nil completionBlock:^(id result) {
            self.searchResults = result;
            [subscriber sendNext:self.searchResults];
            [subscriber sendCompleted];
        }];

        return nil;
    }];
}
@end
