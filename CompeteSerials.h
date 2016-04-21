//
//  CompeteSerials.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"
#import "CompeteSerialsData.h"

@protocol CompeteSerialsData <NSObject>

@end

@interface CompeteSerials : BaseModel

@property(nonatomic,copy)NSString<Optional> *total;

@property(nonatomic,strong) NSArray<ConvertOnDemand,CompeteSerialsData> *data;

@end
