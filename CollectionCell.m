//
//  CollectionCell.m
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/13.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "CollectionCell.h"
#import "UIImageView+AFNetworking.h"

@implementation CollectionCell

-(void)setModel:(AppModel *)model{

    _model = model;
    [self.image setImageWithURL:[NSURL URLWithString:_model.image]];
    self.title.text = _model.title;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
