//
//  LunTanCell2.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-19.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LunTanModel.h"

@protocol LunTanCell2 <NSObject>

@end


@interface LunTanCell2 : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *count;


@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *forum;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UILabel *dete;
@property(nonatomic,strong)LunTanModel *model;


@end











