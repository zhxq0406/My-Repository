//
//  ImageModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel

+(NSArray*)modelWithUrl:(NSString *)urlString json:(id)object{
    
    return [self arrayOfModelsFromDictionaries:object[@"sections"]];
    
}

@end
