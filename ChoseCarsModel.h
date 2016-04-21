//
//  ChoseCarsModel.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"
#import "Serials.h"

@protocol Serials <NSObject>

@end
@interface ChoseCarsModel : BaseModel

@property(nonatomic,strong)NSArray<ConvertOnDemand,Serials> *serials;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *brandName;
@property(nonatomic,strong)NSString *brandIntroduction;

@end
