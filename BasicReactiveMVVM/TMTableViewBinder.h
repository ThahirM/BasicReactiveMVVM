//
//  TMTableViewBinder.h
//  BasicReactiveMVVM
//
//  Created by Thahir on 30/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMTableViewBinderDelegate.h"
@interface TMTableViewBinder : NSObject
@property (weak, nonatomic) id <TMTableViewBinderDelegate> delegate;
- (instancetype)initWithTableView:(UITableView *)tableView
                     sourceSignal:(RACSignal *)sourceSignal
                 selectionCommand:(RACCommand *)selection
                        cellClass:(Class)CellClass;

+ (instancetype)bindTableView:(UITableView *)tableView
             withSourceSignal:(RACSignal *)sourceSignal
             selectionCommand:(RACCommand *)selection
                    cellClass:(Class)CellClass;

@end
