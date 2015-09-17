//
//  TFSearchResultTableViewCell.m
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import "TFSearchResultTableViewCell.h"
#import "TFSearchResultTextView.h"

@interface TFSearchResultTableViewCell ()

@property (nonatomic, strong) TFSearchResultTextView* searchResultTextView;

@end

@implementation TFSearchResultTableViewCell


- (instancetype)initWithReuseIdentifier:(NSString*)reuseID{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    if (self) {
        [self.contentView addSubview:self.searchResultTextView];
    }
    return self;
}

- (TFSearchResultTextView*)searchResultTextView{
    if (_searchResultTextView == nil) {
        _searchResultTextView = [[TFSearchResultTextView alloc] init];
        _searchResultTextView.backgroundColor = [UIColor clearColor];
    }
    return _searchResultTextView;
}

- (void)setSearchResult:(TFSearchResult *)searchResult{
    if (_searchResult == searchResult) {
        return;
    }
    _searchResult = searchResult;
    [self updateText];
    [self setNeedsLayout];
}

- (void)updateText{
    self.searchResultTextView.searchResultText = self.searchResult.text;
}

static const CGFloat kLeftEdgeTextView = 10;
static const CGFloat kTopEdgeTextView = 10;

- (void)layoutSubviews{
    [super layoutSubviews];
    self.searchResultTextView.frame = CGRectMake(kLeftEdgeTextView, kTopEdgeTextView, self.contentView.bounds.size.width - 2 * kLeftEdgeTextView, [[self class] sizeOfCellWithCommentObject:self.searchResult] - 2 * kTopEdgeTextView);
}

+ (CGFloat)sizeOfCellWithCommentObject:(TFSearchResult*)searchResult{
    return [TFSearchResultTextView heightForAttributedString:searchResult.text width:[[UIScreen mainScreen] bounds].size.width - 2 * kLeftEdgeTextView] + 2 * kTopEdgeTextView;
}

@end
