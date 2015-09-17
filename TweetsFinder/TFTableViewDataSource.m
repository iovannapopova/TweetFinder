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
#import "TFLoadTableViewCell.h"

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
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case TFTableViewResultType:
        {
            static NSString* resultCellID = @"ResultCell";
            UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:resultCellID];
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
            UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indicatorCellID];
            if (!cell) {
                cell = [[TFLoadTableViewCell alloc] initWithReuseIdentifier:indicatorCellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
