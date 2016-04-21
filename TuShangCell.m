//
//  TuShangCell.m
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "TuShangCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TuShangCell

-(void)setModel:(InformationModel *)model{

    _model = model;
    [self.image setImageWithURL:[NSURL URLWithString:_model.cover]];
  
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
