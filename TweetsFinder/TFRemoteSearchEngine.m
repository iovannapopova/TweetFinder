//
//  TFRemoteSearchEngine.m
//  TweetsFinder
//
//  Created by Iovanna Popova on 16.09.15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

#import "TFRemoteSearchEngine.h"

@interface TFRemoteSearchEngine ()

@property (nonatomic, strong) NSURL* templateURL;
@property (nonatomic, strong) NSString* searchTermParameterName;
@property (nonatomic, assign) TFRemoteSearchEngineResultParser resultParser;
@property (nonatomic, strong) NSURLSession* session;

@end

@implementation TFRemoteSearchEngine

-(instancetype)initWithTemplateURL:(NSURL*)templateURL searchTermParameterName:(NSString*)searchTermParameterName resultParser:(TFRemoteSearchEngineResultParser)resultParser{
    self = [super init];
    if (self) {
        _templateURL = templateURL;
        _searchTermParameterName = [searchTermParameterName copy];
        _resultParser = resultParser;
    }
    return self;
}

-(NSURLSession*)session{
    return [NSURLSession sharedSession];
}

-(void)searchForString:(NSString *)string completionHandler:(void (^)(NSArray *, NSError *))completionHandler{
    
    NSURLComponents* urlComponents = [NSURLComponents componentsWithURL:self.templateURL resolvingAgainstBaseURL:NO];
    NSURLQueryItem* queryItem = [[NSURLQueryItem alloc] initWithName:self.searchTermParameterName value:string];
    NSMutableArray* mutableItems = urlComponents.queryItems ? [urlComponents.queryItems mutableCopy] : [[NSMutableArray alloc] init];
    [mutableItems addObject:queryItem];
    urlComponents.queryItems = mutableItems;
    
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:urlComponents.URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
            if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
                NSError* jsonError;
                NSDictionary* resultDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                if (resultDictionary && self.resultParser) {
                    dispatch_async(dispatch_get_main_queue(), ^{ completionHandler(self.resultParser(resultDictionary), nil); });
                }
                else {
                    dispatch_async(dispatch_get_main_queue(), ^{ completionHandler(nil, jsonError); });
                }
            }
            else {
                NSError* httpError = [NSError errorWithDomain:@"TFRemoteSearchEngine" code:httpResponse.statusCode userInfo:nil];
                dispatch_async(dispatch_get_main_queue(), ^{ completionHandler(nil, httpError); });
            }
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{ completionHandler(nil, error); });
        }
    }];
    [task resume];
}


@end
