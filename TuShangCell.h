//
//  TuShangCell.h
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationModel.h"

@interface TuShangCell : UITableViewCell

@property(nonatomic,strong)InformationModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
