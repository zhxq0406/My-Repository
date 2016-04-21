//
//  ChoseCarsModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "ChoseCarsModel.h"

@implementation ChoseCarsModel



+(NSArray *)modelWithUrl:(NSString *)urlString json:(id)object{
    NSMutableArray *muArray = [[NSMutableArray alloc]init];
    NSArray *array = object[@"manufacturers"];
//    for (NSDictionary *dict in array) {
//        NSArray *array = dict[@"serials"];
//        [muArray addObject:[self arrayOfModelsFromDictionaries:array]];
//    }
//    return muArray;
   return  [self arrayOfModelsFromDictionaries:array];
   
}

@end
