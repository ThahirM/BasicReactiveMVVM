//
//  TMTableViewBinderDelegate.h
//  BasicReactiveMVVM
//
//  Created by Thahir on 30/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TMTableViewBinderDelegate <UITableViewDelegate>
@optional
- (void)cellButtonTap:(id)data;
@end
