//
//  SalesData.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"

@interface SalesData : BaseModel

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString<Optional> *price;
@property(nonatomic,copy)NSString<Optional> *config;
@property(nonatomic,copy)NSString<Optional> *minPrice;
@end
