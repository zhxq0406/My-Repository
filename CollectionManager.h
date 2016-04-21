//
//  CollectionManager.h
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/13.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InformationModel.h"

@interface CollectionManager : NSObject

+(BOOL)isfavourite:(InformationModel *)model;

+(void)insertApp:(InformationModel *)model;

+(void)deleteModel:(InformationModel *)model;

+(NSArray *)findAppALL;

@end
