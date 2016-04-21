//
//  BaseViewController.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJRefresh.h"
#import "RequestManager.h"
#import "SliderViewController.h"
#import "MBProgressHUD+NJ.h"


@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,DJRefreshDelegate>

//@property(nonatomic,strong)SliderViewController *slider;
@property(nonatomic,strong)RequestManager * manager;//请求类

@property(nonatomic,strong)NSMutableArray * dataSource;//数据源数组

@property(nonatomic,strong)UITableView * tableView;
//刷新控件
@property(nonatomic,strong)DJRefresh * refresh;

@property(nonatomic,strong)MBProgressHUD * hud;


//开始转动
-(void)startAnimationHud;

//隐藏转动
-(void)stopHud;

//创建左边Item按钮
-(void)createLeftItemWithTitle:(NSString*)title;

-(void)createRightItemWithTitle:(NSString*)title;


-(void)clickLeft:(UIBarButtonItem*)item;
-(void)clickRight:(UIBarButtonItem*)item;


@end
