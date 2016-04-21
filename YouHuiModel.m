//
//  YouHuiModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "YouHuiModel.h"

@implementation YouHuiModel

+(NSArray *)modelWithUrl:(NSString *)urlString json:(id)object{
    NSLog(@"请求=====%@",object);
    NSLog(@"+++++%@",object[@"data"]);
    NSArray *array = object[@"data"];
    return [self arrayOfModelsFromDictionaries:array];

}

@end
