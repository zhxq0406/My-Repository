//
//  CarViewController.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseViewController.h"
#import "SliderViewController.h"
#import "AIMTableViewIndexBar.h"

@protocol CarDelegate <NSObject>

-(void)getValue:(NSString *)str;

@end

@interface CarViewController : BaseViewController

@property(nonatomic,strong)id<CarDelegate>delegate;
@property(nonatomic,strong)SliderViewController *slider;

@end
