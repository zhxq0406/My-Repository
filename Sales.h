//
//  Sales.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"
#import "SalesData.h"
#import "salesModel.h"

@protocol SalesData <NSObject>

@end

@interface Sales : BaseModel



@property(nonatomic,copy)NSString <Optional>*title;

@property (nonatomic,strong)NSArray <ConvertOnDemand,SalesData>*data;


@end
