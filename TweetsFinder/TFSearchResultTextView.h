//
//  TFSearchResultTextView.h
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFSearchResultTextView : UIView

@property (nonatomic, strong) NSAttributedString* searchResultText;

+ (CGFloat)heightForAttributedString:(NSAttributedString*)string width:(CGFloat)width;

@end
