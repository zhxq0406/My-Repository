//
//  ChooseCarsViewController.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-13.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseViewController.h"
#import "CarModel.h"
#import "CarViewController.h"

@interface ChooseCarsViewController : BaseViewController<CarDelegate>
@property(nonatomic,strong)NSString *Cid;
@property(nonatomic,strong)CarModel *model;
@end
