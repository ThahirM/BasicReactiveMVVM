//
//  RACCommand+Completion.m
//  RWTFlickrSearch
//
//  Created by Thahir on 23/07/14.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "RACCommand+Completion.h"
@implementation RACCommand (Completion)

- (RACSignal *)completionSignal {
    return [self.executionSignals flattenMap:^RACStream *(RACSignal *signal) {
        return [[signal materialize] filter:^BOOL(RACEvent *event) {
            return event.eventType == RACEventTypeCompleted;
        }] ? signal : nil;
        
    }];
}
     
@end
