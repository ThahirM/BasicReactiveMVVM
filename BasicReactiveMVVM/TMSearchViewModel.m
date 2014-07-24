//
//  TMSearchViewModel.m
//  BasicReactiveMVVM
//
//  Created by Thahir on 24/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import "TMSearchViewModel.h"

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

- (RACSignal *)executeSearchSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {

        self.searchResults = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j"].mutableCopy;
        [subscriber sendNext:self.searchResults];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
}
@end
