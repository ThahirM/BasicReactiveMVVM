//
//  RACCommand+Completion.h
//  RWTFlickrSearch
//
//  Created by Thahir on 23/07/14.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "RACCommand.h"
@interface RACCommand (Completion)
- (RACSignal *)completionSignal;
@end
