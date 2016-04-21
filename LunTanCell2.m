//
//  LunTanCell2.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-19.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "LunTanCell2.h"

@implementation LunTanCell2

-(void)setModel:(LunTanModel *)model{
    
    _model = model;
    self.dete.text = _model.datatime;
    self.desc.text = _model.desc;
    self.count.text = [NSString stringWithFormat:@"%@回",_model.replycount];
    [self.headImage setImageWithURL:[NSURL URLWithString:_model.userface]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
