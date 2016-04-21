//
//  LunTanModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-19.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "LunTanModel.h"

@implementation LunTanModel

+(NSArray *)modelWithUrl:(NSString *)urlString json:(id)object{
   // NSLog(@"请求=====%@",object);
   
    return [self arrayOfModelsFromDictionaries:object];
    
}

@end
