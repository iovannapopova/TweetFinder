//
//  NSArray+TFAdditions.h
//  MusicFinder
//
//  Created by Iovanna Popova on 04/05/15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TFAdditions)

-(NSArray*)tf_map:(id (^)(id))transform;
-(NSArray*)tf_filter:(BOOL (^)(id))include;

@end
