//
//  SearchTableViewCell.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-24.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "SearchTableViewCell.h"

@implementation SearchTableViewCell

-(void)setModel:(SearchModel *)model{

    _model = model;
   
    self.name.text = _model.name;
    
    NSAttributedString *priceAttribute = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",_model.priceRange] attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}] ;
    self.price.attributedText = priceAttribute;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
