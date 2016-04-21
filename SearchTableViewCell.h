//
//  SearchTableViewCell.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-24.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchModel.h"

@interface SearchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property(nonatomic,strong) SearchModel *model;

@end
