//
//  CarSections.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-13.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "CarSections.h"

@implementation CarSections


+(JSONKeyMapper *)keyMapper{
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"Cid"}];
    
}


+(NSArray*)modelWithUrl:(NSString *)urlString json:(id)object{
    
    // NSLog(@"看下数据=====%@",object);
    // NSLog(@"*************%@",object[@"sections"]);
    
    return [self arrayOfModelsFromDictionaries:object[@"brands"]];
    
}

@end
