//
//  TFSearchBarDelegate.h
//  TweetsFinder
//
//  Created by Iovanna Popova on 16.09.15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TFSearchBarDelegate;

@protocol TFSearchTextProtocol <NSObject>

- (void)searchText:(NSString*)text searchBarDelegate:(TFSearchBarDelegate*)searchBarDelegate;

@end

@interface TFSearchBarDelegate : NSObject <UISearchBarDelegate>

@property (nonatomic, weak) id<TFSearchTextProtocol> delegate;

@end
