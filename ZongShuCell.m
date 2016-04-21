//
//  ZongShuCell.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-16.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "ZongShuCell.h"
#import "Sales.h"

@implementation ZongShuCell

-(void)setModel:(ZongShuModel *)model{

    _model = model;
    self.title.text = self.model.title;
    self.price.text = [NSString stringWithFormat:@"%@万起", self.model.price];
    self.config.text =  self.model.config;
    
    //原价 label添加删除线  属性字符串
    NSAttributedString * price = [[NSAttributedString alloc] initWithString:_model.minPrice attributes:@{
                                                                                                          NSStrikethroughStyleAttributeName : @(
                                                                                                              NSUnderlineStyleSingle|NSUnderlinePatternSolid),
                                                                                                          NSStrikethroughColorAttributeName:[UIColor redColor]
                                                                                                          }];
    
    self.minPrice.attributedText =  price;
   
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
