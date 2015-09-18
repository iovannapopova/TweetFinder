//
//  Header.h
//  TweetsFinder
//
//  Created by Iovanna Popova on 16.09.15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

@protocol TFSearchEngine <NSObject>

-(void)searchForString:(NSString*)string completionHandler:(void(^)(NSArray*,NSError*))completionHandler;
-(void)searchNextResult:(NSNumber*)nextResultID completionHandler:(void(^)(NSArray*,NSError*))completionHandler;

@end

