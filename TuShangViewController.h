//
//  TuShangViewController.h
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationModel.h"
#import "BaseViewController.h"
#import "RequestManager.h"

@interface TuShangViewController : BaseViewController

@property(nonatomic,strong)RequestManager * manager;//请求类
@property(nonatomic,strong)InformationModel *model;

-(void)customLeftItemWithTitle:(NSString*)title;
@end
