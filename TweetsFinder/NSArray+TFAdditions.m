//
//  NSArray+TFAdditions.m
//  MusicFinder
//
//  Created by Iovanna Popova on 04/05/15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

#import "NSArray+TFAdditions.h"

@implementation NSArray (TFAdditions)

-(NSArray*)tf_map:(id (^)(id))transform{
    NSMutableArray* result = [[NSMutableArray alloc] init];
    for (id obj in self) {
        id mappedObj = transform(obj);
        [result addObject:mappedObj];
    }
    return [result copy];
}

-(NSArray*)tf_filter:(BOOL (^)(id))include{
    NSMutableArray* result = [[NSMutableArray alloc] init];
    for (id obj in self) {
        if (include(obj)) {
            [result addObject:obj];
        }
    }
    return [result copy];
}

@end
