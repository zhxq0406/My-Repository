//
//  RequestManager.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "RequestManager.h"
#import "BaseModel.h"
#import "AFNetworking.h"
#import "UrlMacro.h"
#import "ZongShuModel.h"

static YTKKeyValueStore *store;
static NSString *tableName;

@interface RequestManager()

@property(nonatomic,strong)AFHTTPRequestOperationManager * manager;

@end



@implementation RequestManager

-(AFHTTPRequestOperationManager *)manager{
    if (_manager == nil) {
        _manager = [AFHTTPRequestOperationManager manager];
        
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
        
    }
    return _manager;
    
}

+(YTKKeyValueStore *)store{

    if (store == nil) {
        store = [[YTKKeyValueStore alloc]initDBWithName:@"text.db"];
    }
    return store;
}

+(NSString *)tableName{

    if (tableName == nil) {
        tableName = @"MyTable";
    }
    return tableName;
}

-(void)requestWithUrl:(NSString *)urlString option:(BcRequestCenterCachePolicy)option parameters:(NSDictionary *)dic complicate:(Complicate)complicate modelClass:(Class)modelClass{
    
    switch (option) {
      case BcRequestCenterCachePolicyNormal:{ // 普通的网络请求
         [self.manager GET:urlString parameters:dic success:^(AFHTTPRequestOperation *  operation, id   responseObject) {

        NSArray * models = [modelClass modelWithUrl:urlString json:responseObject];
        complicate(YES,models);
        
      } failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
        //
        complicate(NO,error);
        NSLog(@"%@",error);
        
      }];
   }
            break;
        case BcRequestCenterCachePolicyCacheAndLocal:{//优先读取本地，不管有没有网络，优先读取本地
            
            NSDictionary *queryUser = [[RequestManager store] getObjectById:urlString fromTable:[RequestManager tableName]];//从缓存中读取数据
           
            if (queryUser) {
                
                NSArray * models = [modelClass modelWithUrl:urlString json:queryUser];
                NSLog(@"系统有缓存 %@",queryUser);
                complicate(YES,models);
               
                return;
            }
            [self.manager GET:urlString parameters:dic success:^(AFHTTPRequestOperation *  operation, id   responseObject) {
                    
                    if (!queryUser) {//如果缓存中没有数据
                        
                        NSArray *array = (id)[modelClass modelWithUrl:urlString json:responseObject];
                         [[RequestManager store] createTableWithName:[RequestManager tableName]];
                         [[RequestManager store] putObject:responseObject withId:urlString intoTable:[RequestManager tableName]];
                        complicate(YES,array);
                        NSLog(@"第一次进入系统没有缓存");
                        
                       
                    }
                
            } failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
     
                complicate(NO,error);
                NSLog(@"%@",error);
                
            }];

        }
   }
    
}




@end
