//
//  YouHuiModel.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"

@interface YouHuiModel : BaseModel

@property(nonatomic,copy)NSString *area;
@property(nonatomic,copy)NSString *modelName;
@property(nonatomic,copy)NSString *dealerName;
@property(nonatomic,copy)NSString *dealerId;
@property(nonatomic,copy)NSString *price;//现价
@property(nonatomic,copy)NSString *dealerPrice;//原价
@property(nonatomic,copy)NSString *phone;
@end
