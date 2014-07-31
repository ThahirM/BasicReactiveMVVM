//
//  TMTableViewBinder.m
//  BasicReactiveMVVM
//
//  Created by Thahir on 30/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import "TMTableViewBinder.h"
#import "TMCellViewModel.h"

@interface TMTableViewBinder () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) Class TableViewCellClass;
@property (nonatomic, strong) RACCommand *selectionCommand;
@end

@implementation TMTableViewBinder

- (instancetype)initWithTableView:(UITableView *)tableView sourceSignal:(RACSignal *)sourceSignal selectionCommand:(RACCommand *)selection cellClass:(__unsafe_unretained Class)CellClass {
    
    if (self = [super init]) {
        
        // set the class properties
        self.tableView = tableView;
        self.arrayData = [NSArray array];
        self.selectionCommand = selection;
        self.TableViewCellClass = CellClass;
        
        // set the cell height as the tableview row height
        if ([self.TableViewCellClass conformsToProtocol:@protocol(TMReactiveCell)]) self.tableView.rowHeight = [self.TableViewCellClass cellHeight];
        
        // connect datasource and delegate
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        // subscribe the source signal for data and reload table for any change
        [sourceSignal subscribeNext:^(id x) {
            self.arrayData = x;
            [self.tableView reloadData];
        }];
    }
    return self;
}

+ (instancetype)bindTableView:(UITableView *)tableView withSourceSignal:(RACSignal *)sourceSignal selectionCommand:(RACCommand *)selection cellClass:(__unsafe_unretained Class)CellClass {
    return [[TMTableViewBinder alloc] initWithTableView:tableView sourceSignal:sourceSignal selectionCommand:selection cellClass:CellClass];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id <TMReactiveCell> cell = [tableView dequeueReusableCellWithIdentifier:[self.TableViewCellClass reuseIdentifier]];
    TMCellViewModel *viewModel = [[TMCellViewModel alloc] initWithIndexPath:indexPath andData:self.arrayData[indexPath.row]];
    viewModel.binderDelegate = self.delegate;
    [cell bindViewModel:viewModel];
    return (UITableViewCell *)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // execute the command
    [self.selectionCommand execute:self.arrayData[indexPath.row]];
    
    // forward the delegate method
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

#pragma mark = UITableViewDelegate forwarding

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate scrollViewDidScroll:scrollView];
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:aSelector]) {
        return self.delegate;
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
