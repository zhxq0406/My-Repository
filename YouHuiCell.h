//
//  YouHuiCell.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouHuiModel.h"

@protocol MyDelegate <NSObject>

-(void)addView:(UIView *)view;

@end


@interface YouHuiCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *dealerName;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property(nonatomic,strong)YouHuiModel *model;

@property (weak, nonatomic) IBOutlet UILabel *drop;

@property(nonatomic,strong)id<MyDelegate> delegate;
@property(nonatomic,copy)NSString *phoneNum;

@end
