//
//  InformationHeaderView.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-11.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderModel.h"
@interface InformationHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)UIButton *button;
@property (weak, nonatomic) IBOutlet UIPageControl *page;
@property (nonatomic,strong)NSArray * models;
//加好方法供外面调用
+(instancetype)viewWithModels:(NSArray*)array frame:(CGRect)frame;

@end
