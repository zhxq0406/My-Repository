//
//  TuShangModel.m
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "TuShangModel.h"

@implementation TuShangModel

+(NSArray *)modelWithUrl:(NSString *)urlString json:(id)object{

    NSArray *dict = object[@"photos"];
    return [self arrayOfModelsFromDictionaries:dict];

}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

@end
