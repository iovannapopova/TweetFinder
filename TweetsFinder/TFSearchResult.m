//
//  TFSearchResult.m
//  TweetsFinder
//
//  Created by Iovanna Popova on 16.09.15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

#import "TFSearchResult.h"

@implementation TFSearchResult

-(instancetype)initWithText:(NSAttributedString*)text nextResultID:(NSNumber *)nextResultID{
    self = [super init];
    if (self) {
        _text = [text copy];
        _nextResultID = nextResultID;
    }
    return self;
}

@end
