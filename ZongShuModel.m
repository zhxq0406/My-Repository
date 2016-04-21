//
//  ZongShuModel.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "ZongShuModel.h"

@implementation ZongShuModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}


+(NSArray *)modelWithUrl:(NSString *)urlString json:(id)object{
 
    NSLog(@"%@",object);

    NSError *error = nil;
    ZongShuModel *zong = [[self alloc] initWithDictionary:object error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    
    
    return @[zong];
    
  
}

@end
