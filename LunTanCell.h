//
//  LunTanCell.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-19.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LunTanModel.h"
//#import "topicimg.h"

@protocol LunTanCell <NSObject>


@end

@interface LunTanCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image1;

@property (weak, nonatomic) IBOutlet UIImageView *image2;

@property (weak, nonatomic) IBOutlet UIImageView *image3;


@property (weak, nonatomic) IBOutlet UILabel *count;

@property (weak, nonatomic) IBOutlet UIImageView *userface;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *forum;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (weak, nonatomic) IBOutlet UILabel *date;
@property(nonatomic,strong)LunTanModel *model;
@property(nonatomic,copy)NSString *num;

@end
