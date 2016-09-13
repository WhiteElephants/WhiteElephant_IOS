//
//  NAAddHeaderViewCell.m
//  NiceArticle
//
//  Created by krmao on 16/9/13.
//  Copyright © 2016年 WhiteElephant. All rights reserved.
//

#import "NAAddTextViewCell.h"

@implementation NAAddTextViewCell

- (void)awakeFromNib {
    // Initialization code
    [_textView setText:@"请输入中文"];
    [_textView setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2 ]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
