//
//  CarDetailViewController.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseViewController.h"
#import "ChoseCarsModel.h"
#import "Serials.h"

@interface CarDetailViewController : BaseViewController

@property(nonatomic,strong)ChoseCarsModel *model;

@property(nonatomic,strong)Serials *serialmodel;
@end
