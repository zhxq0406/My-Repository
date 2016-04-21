//
//  HeaderView.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-21.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZongShuModel.h"

@interface HeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *kind;

@property (weak, nonatomic) IBOutlet UILabel *priceRange;

@property (weak, nonatomic) IBOutlet UILabel *score;

@property(nonatomic,strong)ZongShuModel *model;

+(instancetype)viewWithModels:(ZongShuModel *)model frame:(CGRect)frame;
@end
