//
//  YouHuiCell.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "YouHuiCell.h"

@implementation YouHuiCell

-(void)setModel:(YouHuiModel *)model{

    _model = model;
    self.title.text = _model.modelName;
    self.dealerName.text = _model.dealerName;
    self.price.text = [NSString stringWithFormat:@"¥%@万",_model.price];
    self.drop.text = [NSString stringWithFormat:@"优惠¥%.2f万",_model.dealerPrice.floatValue - _model.price.floatValue];
    self.phoneNum = _model.phone;
}





- (IBAction)call:(id)sender {
    
      NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",self.phoneNum];
      NSArray *array = [str componentsSeparatedByString:@"转"];
      NSString *number = [array componentsJoinedByString:@","];
      NSLog(@"%@",number);
      UIWebView * callWebview = [[UIWebView alloc] init];    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:number]]];
    
     [self.delegate addView:callWebview];
}
- (IBAction)youhui:(id)sender {
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
