//
//  TableViewCell.m
//  TestDemo
//
//  Created by chenfeng on 15/7/21.
//  Copyright (c) 2015年 chenfeng. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)updateConstraints
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [super updateConstraints];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView layoutSubviews]; //约束，布局都已经更新过了，只是读取数据而已
    
    if (self.titleLb.numberOfLines == 0 && self.titleLb.bounds.size.width != self.titleLb.preferredMaxLayoutWidth) {
        self.titleLb.preferredMaxLayoutWidth = self.titleLb.bounds.size.width;
    }
    if (self.subTitleLb.numberOfLines == 0 && self.subTitleLb.bounds.size.width != self.subTitleLb.preferredMaxLayoutWidth) {
        self.subTitleLb.preferredMaxLayoutWidth = self.subTitleLb.bounds.size.width;
    }
    
    NSLog(@"%@ ",NSStringFromSelector(_cmd));

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
