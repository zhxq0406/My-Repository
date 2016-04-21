//
//  BaseModel.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//


#import "JSONModel.h"
#import "UIImageView+AFNetworking.h"
@interface BaseModel : JSONModel

//解析 对应接口 对应 json数据 object  变成  模型数组

+(NSArray*)modelWithUrl:(NSString *)urlString json:(id)object;


@end
