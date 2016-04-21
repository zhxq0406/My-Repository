//
//  ChoseCarsCell.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Serials.h"

@interface ChoseCarsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *kind;
@property (nonatomic,strong) Serials *model;


@end
