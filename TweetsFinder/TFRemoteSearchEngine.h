//
//  TFRemoteSearchEngine.h
//  TweetsFinder
//
//  Created by Iovanna Popova on 16.09.15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFSearchEngine.h"

typedef NSArray*(^TFRemoteSearchEngineResultParser)(NSDictionary* resultDictionary);

@interface TFRemoteSearchEngine : NSObject <TFSearchEngine>

-(instancetype)initWithTemplateURL:(NSURL*)templateURL searchTermParameterName:(NSString*)searchTermParameterName resultParser:(TFRemoteSearchEngineResultParser)resultParser;

@end
