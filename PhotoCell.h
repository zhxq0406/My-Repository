//
//  PhotoCell.h
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/12.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModel.h"

@interface PhotoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photo1;

@property (weak, nonatomic) IBOutlet UIImageView *photo2;

@property (weak, nonatomic) IBOutlet UIImageView *photo3;
@property (weak, nonatomic) IBOutlet UIImageView *photo4;

@property (weak, nonatomic) IBOutlet UIImageView *photo5;

@property (weak, nonatomic) IBOutlet UIButton *more;

@property(nonatomic,strong) ImageModel *model;
@end
