//
//  CarCell.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-14.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "CarCell.h"
#import "UIImageView+AFNetworking.h"
@implementation CarCell

-(void)setModel:(CarModel *)model{

    _model = model;
    self.icon.image = nil;
    [self.icon setImageWithURL:[NSURL URLWithString:_model.logo]];
    self.name.text = _model.name;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
