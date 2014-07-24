//
//  TMResultsViewController.h
//  BasicReactiveMVVM
//
//  Created by Thahir on 24/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMSearchViewModel.h"
@interface TMResultsViewController : UITableViewController
@property (nonatomic, strong) TMSearchViewModel *viewModel;
@end
