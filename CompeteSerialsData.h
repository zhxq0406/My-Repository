//
//  CompeteSerialsData.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-16.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"

@interface CompeteSerialsData : BaseModel

@property(nonatomic,copy) NSString *priceRange;
@property(nonatomic,copy) NSString *manufactureName;
@property(nonatomic,copy) NSString *serialGroupName;

@end
