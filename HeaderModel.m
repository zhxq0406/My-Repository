//
//  HeaderModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-11.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "HeaderModel.h"

@implementation HeaderModel

+(JSONKeyMapper *)keyMapper{

    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"Cid"}];

}

+(NSArray *)modelWithUrl:(NSString *)urlString json:(id)object{

    NSArray *dict = object[@"focus"];
    return [self arrayOfModelsFromDictionaries:dict];

}

@end
