//
//  CollectionCell.h
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/13.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"

@interface CollectionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property(nonatomic,strong) AppModel *model;
@end
