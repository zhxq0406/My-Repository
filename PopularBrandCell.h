//
//  PopularBrandCell.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopularBrandModel.h"

@interface PopularBrandCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;

@property(nonatomic,strong)PopularBrandModel *model;
@end
