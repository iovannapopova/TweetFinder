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

typedef NS_ENUM(NSInteger, TFTableViewType){
    TFTableViewResultType,
    TFTableViewIndicatorType
};

@implementation TFTableViewDataSource

- (void)setSearchResultsArray:(NSArray *)searchResultsArray{
    if (_searchResultsArray == searchResultsArray) {
        return;
    }
    _searchResultsArray = searchResultsArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case TFTableViewResultType:
            return [self.searchResultsArray count];
            break;
        
        case TFTableViewIndicatorType:
            return 1;
            break;
            
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.searchResultsArray count] > 0 ? 2 : 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case TFTableViewResultType:
        {
            static NSString* resultCellID = @"ResultCell";
            TFSearchResultTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:resultCellID];
            if (!cell) {
                cell = [[TFSearchResultTableViewCell alloc] initWithReuseIdentifier:resultCellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            [(TFSearchResultTableViewCell*)cell setSearchResult:(TFSearchResult*)[self.searchResultsArray objectAtIndex:indexPath.row]];
            return cell;
        }
            break;
            
        case TFTableViewIndicatorType:
        {
            static NSString* indicatorCellID = @"IndicatorCell";
            TFLoadTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indicatorCellID];
            if (!cell) {
                cell = [[TFLoadTableViewCell alloc] initWithReuseIdentifier:indicatorCellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.delegate = self.delegate;
            }
            return cell;
        }
            break;
            
        default:
            break;
    }
    
    return nil;
}

@end
