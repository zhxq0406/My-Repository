//
//  PopularBrand.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "PopularBrandModel.h"

@implementation PopularBrandModel

+(JSONKeyMapper *)keyMapper{
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"cid"}];
    
}

+(NSArray*)modelWithUrl:(NSString *)urlString json:(id)object{
    
    // NSLog(@"看下数据=====%@",object);
    // NSLog(@"*************%@",object[@"sections"]);
    
    return [self arrayOfModelsFromDictionaries:object[@"brands"]];
    //return @[object];
}

@end
