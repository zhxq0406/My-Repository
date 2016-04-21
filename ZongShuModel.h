//
//  ZongShuModel.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"
#import "Sales.h"
#import "CompeteSerials.h"

@protocol Sales <NSObject>

@end

@protocol CompeteSerials <NSObject>

@end

@interface ZongShuModel : BaseModel

@property(nonatomic,copy)NSString *kind;
@property(nonatomic,copy)NSString *manufacturer;
@property(nonatomic,copy)NSString *priceRange;
@property(nonatomic,copy)NSString *photoTotal;
@property(nonatomic,copy)NSString *photo_400x300;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *sgAverageScore;
@property(nonatomic,strong)NSArray<ConvertOnDemand,Sales,Optional> *sales;

@property(nonatomic,strong)CompeteSerials<Optional> *competeSerials;


@end
