//
//  RequestManager.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKKeyValueStore.h"

typedef void(^Complicate)(BOOL success,id object);

typedef NS_ENUM(NSUInteger, BcRequestCenterCachePolicy) {
    
    /**
     *  普通网络请求,不会有缓存
     */
    BcRequestCenterCachePolicyNormal,
    
    /**
     *  优先读取本地，不管有没有网络，优先读取本地
     */
    BcRequestCenterCachePolicyCacheAndLocal
};

@interface RequestManager : NSObject


//请求数据
/**
 *  请求接口
 *
 *  @param urlString  请求地址
 *  @param dic        请求参数
 *  @param complicate  回调
 *  @param modelClass 返回模型类
 */
- (void)requestWithUrl:(NSString*)urlString option:(BcRequestCenterCachePolicy)option parameters:(NSDictionary *)dic complicate:(Complicate)complicate modelClass:(Class)modelClass;


@end
