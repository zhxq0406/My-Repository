//
//  RootVCManager.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "RootVCManager.h"
#import "InformationViewController.h"
#import "ForumViewController.h"
#import "CarViewController.h"
#import "PreferentialViewController.h"
#import "MeViewController.h"
#import "BaseNavigationViewController.h"
#import "SliderViewController.h"
#import "ChooseCarsViewController.h"
#import "AppDelegate.h"

@implementation RootVCManager

+(UIViewController *)rootVC{

    
    ChooseCarsViewController *right = [[ChooseCarsViewController alloc]init];
    UINavigationController *rvc = [[UINavigationController alloc]initWithRootViewController:right];
    
    NSArray *vcClassNames = @[@"InformationViewController",@"CarViewController",@"PreferentialViewController",@"MeViewController"];
    NSArray *imageNames = @[@"btn_tabbar_1@2x.png",@"btn_tabbar_3@2x.png",@"btn_tabbar_4@2x.png",@"btn_tabbar_5@2x.png"];
    NSArray * titles = @[@"资讯",@"找车",@"优惠",@"我的"];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    int i=0;
    for (NSString * name in vcClassNames) {
        
        //创建对应的导航控制器
        UINavigationController * vc = [self nagigationWithClass:NSClassFromString(name)];
        vc.topViewController.title = titles[i];
        //设置导航控制器当前显示的控制器的title
        vc.topViewController.title = titles[i];
        //设置分栏 样式 item
        NSString * normalimage = imageNames[i];
        
        NSString * selectImage = [NSString stringWithFormat:@"%@_hl",normalimage];
        
        UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:normalimage] selectedImage:[UIImage imageNamed:selectImage]];
        
        vc.tabBarItem = item;//设置Item
        //设置图片偏移量
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        
        if ([name isEqualToString:@"CarViewController"] == YES ) {
            
            SliderViewController *slider = [[SliderViewController alloc]init];
            slider.viewControllers = @[vc,rvc];
            slider.tabBarItem = item;
            slider.automaticallyAdjustsScrollViewInsets = NO;
            vc.delegate = right;
            // UINavigationController *sliNC = [[UINavigationController alloc]initWithRootViewController:slider];
            [viewControllers addObject:slider];
            
        }else{
        
            [viewControllers addObject:vc];
        }
        NSLog(@"%@",viewControllers);
      
        i ++;
        
    }
    
    UITabBarController *_tabVc = [[UITabBarController alloc]init];
    _tabVc.tabBar.translucent = NO;
    _tabVc.viewControllers = viewControllers;
    return _tabVc;

}

+(UINavigationController *)nagigationWithClass:(Class)vcClass{
   
    UIViewController * vc = [[vcClass alloc] init];
    
    BaseNavigationViewController * baseNaVC = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
    
    return baseNaVC;
    
}

+(UIViewController *)getWindowRootVC{
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    return  (UINavigationController *)delegate.window.rootViewController;
    
}

@end
