//
//  TitleView.h
//  TitleScrollView
//
//  Created by MS on 16-1-6.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TitleView;
@protocol TitleViewDelegate <NSObject>

//代理方法
-(void)titleView:(TitleView *)view selectIndex:(NSInteger)index;

@end

@interface TitleView : UIView

@property(nonatomic,strong)NSArray *titles;
@property(nonatomic,weak)id<TitleViewDelegate>delegate;
@property(nonatomic,strong)NSMutableArray * buttons;

-(void)selectIndex:(NSInteger)index;

-(void)clickButton:(UIButton *)button;

@end
