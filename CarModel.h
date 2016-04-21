//
//  CarModel.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-12.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"
#import "CarSections.h"
@interface CarModel : BaseModel

@property(nonatomic,strong)NSString *Cid;
@property(nonatomic,strong)NSString *logo;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *letter;
//@property(nonatomic,strong)NSString *rowNum;
@property(nonatomic,strong)NSString<Optional> *index;
//@property(nonatomic,strong)CarSections *sections;
//@property(nonatomic,strong)NSArray *sections;

@end
