//
//  TMCellViewModel.m
//  BasicReactiveMVVM
//
//  Created by Thahir on 30/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import "TMCellViewModel.h"
@interface TMCellViewModel ()
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) id data;
@end

@implementation TMCellViewModel
- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath andData:(id)data {
    if (self = [super init]) {
        self.indexPath = indexPath;
        self.data = data;
        [self initialize];
    }
    return self;
}

- (RACSignal *)buttonCellExecutionCompletionSignal {
    return self.buttonCellCommand.completionSignal;
}

- (void)initialize {
    
    // set the title
    self.title = [NSString stringWithFormat:@"Section:%ld Row:%ld Data:%@", (long)self.indexPath.section, (long)self.indexPath.row, self.data];

    // button action
    self.buttonCellCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self buttonCellSignal];
    }];
}

- (RACSignal *)buttonCellSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"data = %@ and indexpath = %@", _data, _indexPath);
        [subscriber sendNext:RACTuplePack(_data, _indexPath)];
        [subscriber sendCompleted];
        
        return nil;
    }];
}
@end
