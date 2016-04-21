//
//  Serials.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "Serials.h"

@implementation Serials

+(JSONKeyMapper*)keyMapper{
    
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"Cid"}];
    
}

@end
