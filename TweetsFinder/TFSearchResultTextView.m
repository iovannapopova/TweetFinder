//
//  TFSearchResultTextView.m
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import "TFSearchResultTextView.h"

@interface TFSearchResultTextView ()

@property (nonatomic,strong) NSTextStorage* textStorage;
@property (nonatomic,strong) NSLayoutManager* layoutManager;
@property (nonatomic,strong) NSTextContainer* textContainer;

@end

@implementation TFSearchResultTextView

-(NSTextContainer*)textContainer{
    if (_textContainer == nil) {
        _textContainer = [[NSTextContainer alloc] init];
        _textContainer.lineFragmentPadding = 0.0;
        _textContainer.widthTracksTextView = YES;
    }
    return _textContainer;
}

-(NSLayoutManager*)layoutManager{
    if (_layoutManager == nil) {
        _layoutManager = [[NSLayoutManager alloc] init];
        [self.layoutManager addTextContainer:self.textContainer];
        [self.textStorage addLayoutManager:self.layoutManager];
        [self.layoutManager glyphRangeForTextContainer:self.textContainer];
    }
    return _layoutManager;
}

-(NSTextStorage*)textStorage{
    if (_textStorage == nil) {
        _textStorage = [[NSTextStorage alloc] init];
    }
    return _textStorage;
}

- (void)setSearchResultText:(NSAttributedString *)searchResultText{
    if (searchResultText == _searchResultText) {
        return;
    }
    _searchResultText = searchResultText;
    [self updateTextContainer];
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

-(void)updateTextContainer{
    [self.textStorage setAttributedString:self.searchResultText];
}

-(void)drawRect:(CGRect)rect {
    NSRange glyphRange = [self.layoutManager glyphRangeForTextContainer:self.textContainer];
    [self.layoutManager drawGlyphsForGlyphRange:glyphRange atPoint:CGPointMake(0, 0)];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGSize containerSize = CGSizeMake(self.bounds.size.width,  CGFLOAT_MAX);
    self.textContainer.size = containerSize;
}

+(CGFloat)heightForAttributedString:(NSAttributedString*)string  width:(CGFloat)width{
    NSTextStorage* textStorage = [[NSTextStorage alloc] initWithAttributedString:string];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    CGSize containerSize = CGSizeMake(width,  CGFLOAT_MAX);
    
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:containerSize];
    textContainer.lineFragmentPadding = 0.0;
    
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    
    [layoutManager glyphRangeForTextContainer:textContainer];
    
    return [layoutManager usedRectForTextContainer:textContainer].size.height;
}

@end
