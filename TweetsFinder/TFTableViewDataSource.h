//
//  TFTableViewDataSource.h
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TFLoadTableViewCell.h"

@interface TFTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) id<TFLoadCellDelegate> delegate;

@property (nonatomic, strong) NSArray* searchResultsArray;

@end
