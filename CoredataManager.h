//
//  CoredataManager.h
//  ZXQ_NetworkText
//
//  Created by MS on 16-1-4.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface CoredataManager : NSObject

+(BOOL)isfavourite:(UserModel*)model;

+(void)insertUser:(UserModel *)model;

+(void)deleteModel:(UserModel *)model;

+(NSArray *)findAppALL;

@end
