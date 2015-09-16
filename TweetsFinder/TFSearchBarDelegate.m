//
//  TFSearchBarDelegate.m
//  TweetsFinder
//
//  Created by Iovanna Popova on 16.09.15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

#import "TFSearchBarDelegate.h"

@implementation TFSearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    searchBar.text = @"#";
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.delegate searchText:searchBar.text searchBarDelegate:self];
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

@end
