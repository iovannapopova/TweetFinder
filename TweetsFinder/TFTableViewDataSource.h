//
//  TFTableViewDataSource.h
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TFTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray* searchResultsArray;

@end
