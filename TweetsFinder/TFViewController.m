//
//  TFViewController.m
//  TweetsFinder
//
//  Created by Iovanna Popova on 16.09.15.
//  Copyright (c) 2015 Iovanna Popova. All rights reserved.
//

#import "TFViewController.h"
#import "TFSearchBarDelegate.h"
#import "TFSearchEngine.h"
#import "TFRemoteSearchEngine.h"
#import "NSArray+TFAdditions.h"
#import "TFSearchResult.h"

@interface TFViewController () <TFSearchTextProtocol>

@property (nonatomic, strong) UISearchBar* searchBar;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) TFSearchBarDelegate* searchBarDelegate;
@property (nonatomic, strong) id<TFSearchEngine> searchEngine;

@end

@implementation TFViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.tableView];
}

static CGFloat kHeightSearchBar = 80;

- (void)viewWillLayoutSubviews{
    CGSize screenSize = self.view.bounds.size;
    self.searchBar.frame = CGRectMake(0, 0, screenSize.width, kHeightSearchBar);
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), screenSize.width, screenSize.height - CGRectGetMaxY(self.searchBar.frame));
}

#pragma mark - Lazy loading

- (UISearchBar*)searchBar{
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.delegate = self.searchBarDelegate;
    }
    return _searchBar;
}

- (UITableView*)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

- (TFSearchBarDelegate*)searchBarDelegate{
    if (_searchBarDelegate == nil) {
        _searchBarDelegate = [[TFSearchBarDelegate alloc] init];
        _searchBarDelegate.delegate = self;
    }
    return _searchBarDelegate;
}

- (id<TFSearchEngine>)searchEngine{
    if (_searchEngine == nil) {
        NSURL* url = [NSURL URLWithString:@"https://api.vk.com/method/newsfeed.search.json?"];
        NSString* searchTermParameterName = @"q";
        
        TFRemoteSearchEngineResultParser parser = ^(NSDictionary* resultDictionary){
            
            NSArray* resultDict = [resultDictionary objectForKey:@"response"];
            NSMutableArray* mutResultDict = [NSMutableArray arrayWithArray:resultDict];
            [mutResultDict removeObjectAtIndex:0];
            
            return [[mutResultDict copy] tf_map:^TFSearchResult*(NSDictionary* dict) {
                return [[TFSearchResult alloc] initWithText:[dict objectForKey:@"text"]];
            }];
        };
        _searchEngine = [[TFRemoteSearchEngine alloc] initWithTemplateURL:url searchTermParameterName:searchTermParameterName resultParser:parser];
    }
    return _searchEngine;
}



#pragma mark - TFSearchTextProtocol

- (void)searchText:(NSString*)text searchBarDelegate:(TFSearchBarDelegate*)searchBarDelegate{
   [self.searchEngine searchForString:text completionHandler:^(NSArray *array, NSError *error) {
       //
   }];
}

@end
