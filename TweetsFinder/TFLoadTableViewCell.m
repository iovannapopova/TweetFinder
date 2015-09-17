//
//  TFLoadTableViewCell.m
//  TweetsFinder
//
//  Created by Iovanna Popova on 17.09.15.
//  Copyright © 2015 Iovanna Popova. All rights reserved.
//

#import "TFLoadTableViewCell.h"

@interface TFLoadTableViewCell ()

@property (nonatomic, strong) UIButton* button;

@end

@implementation TFLoadTableViewCell

- (instancetype)initWithReuseIdentifier:(NSString*)reuseID{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    if (self) {
        [self.contentView addSubview:self.button];
    }
    return self;
}

- (UIButton*)button{
    if (_button == nil) {
        _button = [[UIButton alloc] init];
        _button.titleLabel.text = @"Load more...";
        _button.titleLabel.textColor = [UIColor blueColor];
        [_button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.button.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

- (void)buttonTouchUpInside:(id)sender{
    
}


@end
