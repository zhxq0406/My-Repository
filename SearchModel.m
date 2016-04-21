//
//  SearchModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-24.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel

+(JSONKeyMapper *)keyMapper{

    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"Cid"}];
    
}

+(NSArray *)modelWithUrl:(NSString *)urlString json:(id)object{

    NSDictionary *dict = object[@"manufacturer"];
    NSArray *array = dict[@"serials"];
    return [self arrayOfModelsFromDictionaries:array];

}

@end
