//
//  TFLoadTableViewCell.h
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TFLoadTableViewCell;

@protocol TFLoadCellDelegate <NSObject>

- (void)loadNextSearchResult:(TFLoadTableViewCell*)cell;

@end

@interface TFLoadTableViewCell : UITableViewCell

@property (nonatomic, weak) id<TFLoadCellDelegate> delegate;

- (instancetype)initWithReuseIdentifier:(NSString*)reuseID;

@end
