//
//  InformationDetailModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-10.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "InformationDetailModel.h"

@implementation InformationDetailModel

+(NSArray*)modelWithUrl:(NSString *)urlString json:(id)object{
    
    NSLog(@"看下数据=====%@",object);
    NSLog(@"%@",object);
 
    return @[object];
    
}

@end
