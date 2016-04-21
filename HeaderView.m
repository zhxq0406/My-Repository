//
//  HeaderView.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-21.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView


+(instancetype)viewWithModels:(ZongShuModel *)model frame:(CGRect)frame{
    
    // [UINib nibWithNibName:@"HeaderView" bundle:nil];
    HeaderView *view = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] firstObject];
    view.frame = frame;
    view.model = model;
    return view;
    
}


-(void)setModel:(ZongShuModel *)model{
    
    _model = model;
    //self.score.text = _model.sgAverageScore;
    [self.image setImageWithURL:[NSURL URLWithString:_model.photo_400x300]];
    
    // 属性字符串
    NSAttributedString * price = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"官方价:￥ %@",_model.priceRange] attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    self.score.text = [NSString stringWithFormat:@"综合评分: %@",_model.sgAverageScore];
    
    NSAttributedString * kind = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@-%@",_model.manufacturer,_model.kind] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.kind.attributedText = kind;
    
    // self.priceRange.text = [NSString stringWithFormat:@"官方价:￥ %@",_model.priceRange];
    self.priceRange.attributedText = price;

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
