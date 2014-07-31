//
//  TMTableViewCell.h
//  BasicReactiveMVVM
//
//  Created by Thahir on 30/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMCellViewModel.h"
@interface TMTableViewCell : UITableViewCell
@property (nonatomic, strong) TMCellViewModel *viewModel;
@end