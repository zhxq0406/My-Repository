//
//  TitleView.m
//  TitleScrollView
//
//  Created by MS on 16-1-6.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "TitleView.h"
@interface TitleView()

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UIView *lineView;

@end

@implementation TitleView

-(void)setTitles:(NSArray *)titles{

    _titles = titles;
    //更新视图显示的内容
    [self initView];


}

-(UIView *)lineView{

    if (_lineView == nil) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-2, 50, 2)];
        _lineView.backgroundColor = [UIColor blueColor];
        [self.scrollView addSubview:_lineView];
    }
    return _lineView;

}

-(NSMutableArray *)buttons{

    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
        
    }
    return _buttons;

}

//初始化子视图
-(void)initView{

    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    //self.scrollView.backgroundColor =[ UIColor redColor];
    self.scrollView.contentSize = CGSizeMake([self totalWidth], self.frame.size.height);
 
    [self selectIndex:0];
    
    [self addSubview:self.scrollView];
    


}
//算出总宽度

-(float)totalWidth{

    float width = 0;
    for (NSString *title in _titles) {
        //计算文字的宽度和高度
//      CGRect rect = [title boundingRectWithSize:CGSizeMake(320, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
//        
//        float buttonWidth = rect.size.width + 20;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width, 0, 60, self.frame.size.height-5);
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        
        width +=60;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置选中状态颜色
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:button];
        [self.scrollView addSubview:button];
    }
    [self clickButton:self.buttons[0]];//默认选中第一个
    return width;//返回总长度
}


-(void)clickButton:(UIButton *)button{

    if (button.selected == YES) {
        return;
    }
    for (UIButton *b in _buttons) {
        b.selected = NO;
    }
    button.selected = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
         self.lineView.frame = CGRectMake(button.frame.origin.x+3, self.frame.size.height-2, button.frame.size.width-6, 2);
    }];
    
    if ([self.delegate respondsToSelector:@selector(titleView:selectIndex:)]) {
        [self.delegate titleView:self selectIndex:[self.buttons indexOfObject:button]];
    }
   
}


-(void)selectIndex:(NSInteger)index{

    UIButton *button = self.buttons[index];
    for (UIButton *b in _buttons) {
        b.selected = NO;
    }
    button.selected = YES;
   // [self.scrollView setContentOffset:CGPointMake(button.frame.origin.x + button.frame.size.width/2 - self.scrollView.frame.size.width/2, 0) animated:YES];
    self.lineView.frame = CGRectMake(button.frame.origin.x, self.frame.size.height-3, button.frame.size.width-6, 2);

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
