//
//  TMCellViewModel.h
//  BasicReactiveMVVM
//
//  Created by Thahir on 30/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMTableViewBinderDelegate.h"
@interface TMCellViewModel : NSObject
@property (nonatomic, strong) id <TMTableViewBinderDelegate> binderDelegate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) RACCommand *buttonCellCommand;
@property (nonatomic, readonly) RACSignal *buttonCellExecutionCompletionSignal;
- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath andData:(id)data;
@end
