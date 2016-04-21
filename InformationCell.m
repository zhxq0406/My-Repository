//
//  InformationCell.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "InformationCell.h"
#import "UIImageView+AFNetworking.h"
@implementation InformationCell

-(void)setModel:(InformationModel *)model{

    _model = model;
    self.title.text = _model.title;
    self.count.text = [NSString stringWithFormat:@"%@评论",_model.count];
    self.date.text = _model.pubDate;
    self.channelName.text = _model.channelName;
    [self.iconImage setImageWithURL:[NSURL URLWithString:_model.image]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
