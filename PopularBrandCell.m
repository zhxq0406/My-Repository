//
//  PopularBrandCell.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "PopularBrandCell.h"

@implementation PopularBrandCell

-(void)setModel:(PopularBrandModel *)model{

    _model = model;
    self.name.text = _model.name;
    [self.icon setImageWithURL:[NSURL URLWithString:_model.logo]];

}

- (void)awakeFromNib {
    // Initialization code
}

@end
