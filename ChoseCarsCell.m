//
//  ChoseCarsCell.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "ChoseCarsCell.h"
#import "UIImageView+AFNetworking.h"

@implementation ChoseCarsCell

-(void)setModel:(Serials *)model{

    _model = model;
    self.name.text = _model.name;
    self.price.text = [NSString stringWithFormat:@"¥%@",_model.priceRange];
    self.kind.text = _model.kind;
    [self.iconImage setImageWithURL:[NSURL URLWithString:_model.photo]];

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
