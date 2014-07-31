//
//  TMReactiveCell.h
//  BasicReactiveMVVM
//
//  Created by Thahir on 30/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TMReactiveCell <NSObject>
+ (NSString *)reuseIdentifier;
+ (CGFloat)cellHeight;
- (void)bindViewModel:(id)viewModel;
@end
