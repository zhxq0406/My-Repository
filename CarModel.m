//
//  CarModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-12.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

+(JSONKeyMapper *)keyMapper{
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"Cid"}];
    
}


+(NSArray*)modelWithUrl:(NSString *)urlString json:(id)object{
   
    NSArray *array = object[@"sections"];
    NSMutableArray *results = [NSMutableArray array];
    
    for (int i=1; i<array.count; i++) {
        NSArray *result = array[i][@"brands"];
        [results addObject:result];
        
    }
    NSMutableArray *resultArray = [NSMutableArray array];
    for (int j=0; j<results.count; j++) {
        NSArray *array =[self arrayOfModelsFromDictionaries:results[j]];
        [resultArray addObject:array];
       
    }
    return resultArray;
 
}

@end
