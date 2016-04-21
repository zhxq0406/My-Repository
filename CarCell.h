//
//  CarCell.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-14.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarModel.h"
@interface CarCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;


@property (weak, nonatomic) IBOutlet UILabel *name;

@property(nonatomic,strong)CarModel *model;

@end
