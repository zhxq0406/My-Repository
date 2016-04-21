//
//  CollectionManager.m
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/13.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "CollectionManager.h"
#import "MagicalRecord.h"
#import "AppLocal.h"

@implementation CollectionManager

+(BOOL)isfavourite:(InformationModel *)model{

    NSArray * array =  [AppLocal MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"cid = %@",model.Cid]];
    
    return array.count;
    
}

+(void)insertApp:(InformationModel *)model{

    AppLocal *applocal = [AppLocal MR_createEntity];
    applocal.image = model.image;
    applocal.url = model.url;
    applocal.title = model.title;
    applocal.cid = model.Cid;
    NSLog(@"%@",model);
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];//同步到数据库
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"MYsqlite.sqlite"];
    NSLog(@"%@",path);
    

}

+(void)deleteModel:(InformationModel *)model{

    NSArray *array = [AppLocal MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"cid=%@",model.Cid]];
    for (AppLocal *applocal in array) {
        [applocal MR_deleteEntity];
    }
    [[NSManagedObjectContext MR_defaultContext]MR_saveOnlySelfAndWait];

}

+(NSArray *)findAppALL{

    NSArray * models = [AppLocal MR_findAll];
    
    NSMutableArray * apps = [NSMutableArray array];
    
    for (AppLocal *model in models) {
        
        InformationModel * app = [[InformationModel alloc] init];
        app.title = model.title;
        app.url = model.url;
        app.image = model.image;
        [apps addObject:app];
    }
    
    
    return apps;

}



@end
