//
//  TFSearchResult.h
//  TweetsFinder
//
//  Created by Iovanna Popova on 16.09.15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFSearchResult : NSObject

@property (nonatomic,copy,readonly) NSAttributedString* text;

-(instancetype)initWithText:(NSAttributedString*)text;

@end