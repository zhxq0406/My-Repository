//
//  LunTanCell.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-19.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "LunTanCell.h"

@implementation LunTanCell

-(void)setModel:(LunTanModel *)model{

    _model = model;
    self.date.text = _model.datatime;
    self.desc.text = _model.desc;
    self.username.text = _model.username;
    self.forum.text = _model.forum;
    //NSArray *array = _model
    [self.image1 setImageWithURL:[NSURL URLWithString:_model.topicimg[0]]];
    //self.image1.image = nil;
    //[self.image2 setImageWithURL:[NSURL URLWithString:_model.topicimg[1]]];
   // [self.image3 setImageWithURL:[NSURL URLWithString:_model.topicimg[2]]];
    self.count.text = [NSString stringWithFormat:@"%@回",_model.replycount];
    [self.userface setImageWithURL:[NSURL URLWithString:_model.userface]];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
