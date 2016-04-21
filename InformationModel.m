//
//  InformationModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-10.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "InformationModel.h"
#import "UrlMacro.h"

@implementation InformationModel


+(JSONKeyMapper *)keyMapper{
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"Cid"}];
    
}

+(NSArray*)modelWithUrl:(NSString *)urlString json:(id)object{
    
   // NSLog(@"%@",object);
    if ([urlString isEqualToString: TuShangUrl]) {
        NSArray *array = object[@"groups"];
        //NSLog(@"%@",array);
        return [self arrayOfModelsFromDictionaries:array];
    }
    NSArray *dict = object[@"data"];

    return [self arrayOfModelsFromDictionaries:dict];
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

@end
