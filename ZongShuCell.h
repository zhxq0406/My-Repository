//
//  ZongShuCell.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-16.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZongShuModel.h"
#import "CompeteSerials.h"
#import "Sales.h"
#import "SalesData.h"

@interface ZongShuCell : UITableViewCell

@property (nonatomic, assign) NSInteger row;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *config;

@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UILabel *minPrice;
//@property(nonatomic,strong)Sales *data;
//@property(nonatomic,strong)ZongShuModel *model;
@property(nonatomic,strong)SalesData *model;
@property(nonatomic,strong)CompeteSerials *CompeteSerialsModel;
@end
