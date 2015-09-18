//
//  TFTableViewDelegate.m
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import "TFTableViewDelegate.h"
#import "TFSearchResultTableViewCell.h"

@implementation TFTableViewDelegate

- (void)setSearchResultsArray:(NSArray *)searchResultsArray{
    if (_searchResultsArray == searchResultsArray) {
        return;
    }
    _searchResultsArray = searchResultsArray;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 80;
    }
    return [TFSearchResultTableViewCell sizeOfCellWithCommentObject:[self.searchResultsArray objectAtIndex:indexPath.row]];
}

@end
