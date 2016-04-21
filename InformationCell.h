//
//  InformationCell.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationModel.h"
@interface InformationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *channelName;

@property(nonatomic,strong)InformationModel *model;
@end
