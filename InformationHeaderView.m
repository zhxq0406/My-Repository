//
//  InformationHeaderView.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-11.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "InformationHeaderView.h"
#import "UIButton+AFNetworking.h"
#import "UIImageView+BCImageView.h"

@interface InformationHeaderView()<UIScrollViewDelegate>

@end

@implementation InformationHeaderView

+(instancetype)viewWithModels:(NSArray*)array frame:(CGRect)frame{

    InformationHeaderView *view = [[[NSBundle mainBundle]loadNibNamed:@"InformationHeaderView" owner:nil options:nil] firstObject];
    view.frame = frame;
    view.models = array;
    return view;
}

-(void)setModels:(NSArray *)models{

    _models = models;
    int i=0;
    for (HeaderModel *model in _models) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:button.frame];
        [button addSubview:imageView];
        //[UIImageView cacheImageView:imageView url:model.image];
       [button setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:model.image]];
        button.tag = i;
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        self.button = button;
        [self.scrollView addSubview:self.button];
        i++;
    }

    self.scrollView.contentSize = CGSizeMake(self.frame.size.width*_models.count, self.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    self.page.numberOfPages = _models.count;
    [self showModelAtIndex:0];
    self.scrollView.delegate = self;
}

-(void)showModelAtIndex:(NSInteger)index{

    //HeaderModel *model = _models[index];
    self.page.currentPage = index;

}

-(void)clickButton:(UIButton *)button{


}
#pragma mark scrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
    [self showModelAtIndex:index];

}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
