//
//  TFTableViewDataSource.m
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import "TFTableViewDataSource.h"
#import "TFSearchResult.h"
#import "TFSearchResultTableViewCell.h"

@implementation TFTableViewDataSource

- (void)setSearchResultsArray:(NSArray *)searchResultsArray{
    if (_searchResultsArray == searchResultsArray) {
        return;
    }
    _searchResultsArray = searchResultsArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.searchResultsArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* resultCellIdentifier = @"ResultCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:resultCellIdentifier];
    if (!cell) {
        cell = [[TFSearchResultTableViewCell alloc] initWithReuseIdentifier:resultCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [(TFSearchResultTableViewCell*)cell setSearchResult:(TFSearchResult*)[self.searchResultsArray objectAtIndex:indexPath.row]];
    return cell;
}

@end
