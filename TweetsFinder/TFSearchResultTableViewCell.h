//
//  TFSearchResultTableViewCell.h
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TFSearchResult.h"

@interface TFSearchResultTableViewCell : UITableViewCell

@property (nonatomic, strong) TFSearchResult* searchResult;

- (instancetype)initWithReuseIdentifier:(NSString*)reuseID;

+ (CGFloat)sizeOfCellWithCommentObject:(TFSearchResult*)searchResult;

@end
