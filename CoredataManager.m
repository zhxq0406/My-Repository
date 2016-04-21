//
//  CoredataManager.m
//  ZXQ_NetworkText
//
//  Created by MS on 16-1-4.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "CoredataManager.h"
#import "User.h"

#import "MagicalRecord.h"

@implementation CoredataManager

+(void)insertUser:(UserModel *)model{
    
    User * user = [User MR_createEntity];
    user.username = model.username;
    user.password = model.password;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];//同步到数据库
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"MYsqlite.sqlite"];
    NSLog(@"%@",path);
    NSLog(@"插入成功");
   
}

+(void)deleteModel:(UserModel *)model{
    
    NSArray * array =  [User MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"username = %@",model.username]];
    
    for (User * user in array) {
        
        [user MR_deleteEntity];//删除
    }
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];//同步到数据库
    
    
}

+(NSArray *)findAppALL{
    
   
    NSArray * models = [User MR_findAll];
    
    NSMutableArray * apps = [NSMutableArray array];
    
    for (User * model in models) {
        
        UserModel * app = [[UserModel alloc] init];
        app.username = model.username;
        app.password = model.password;
        [apps addObject:app];
    }
    
    return apps;
    
}

//+(BOOL)isfavourite:(UserModel*)model{
//    
//    
//    NSArray * array =  [User MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"username = %@",model.username]];
//    
//    return array.count;
//    
//}



@end
