//
//  TuShangViewController.m
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "TuShangViewController.h"
#import "ScreenMarco.h"
#import "TuShangModel.h"
#import "UIImageView+BCImageView.h"
#import "UIImageView+AFNetworking.h"

@interface TuShangViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation TuShangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    //self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBarHidden = YES;
    self.navigationItem.hidesBackButton = NO;
    //self.navigationController.navigationBar.alpha = 0;
    [self loadData];//请求数据
    [self createScroller];
    [self customLeftItemWithTitle:@"返回"];
    [self customRightItemWithTitle:@"保存到相册"];
    
    //[self createImageView];//创建imageView
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)customLeftItemWithTitle:(NSString*)title{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(5, 20, 40, 40);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickLeft:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

-(void)customRightItemWithTitle:(NSString*)title{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(120, 20, 140, 40);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickRight:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)clickLeft:(UIBarButtonItem *)item{
    
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)clickRight:(UIBarButtonItem *)item{

    NSLog(@"%@",self.imageView.image);
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);

}

- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = @"呵呵";
    if (!error) {
        message = @"成功保存到相册";
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alerView show];
    }else
    {
        message = [error description];
    }
    NSLog(@"message is %@",message);
}


-(void)createScroller{

    UIScrollView *sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth, KscreenHeight)];
    sv.contentSize = CGSizeMake(KscreenWidth * self.dataSource.count, KscreenHeight);
    self.scrollView = sv;
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scrollView];
    [self createImageView];

}
-(void)createImageView{

    NSLog(@"%ld",self.dataSource.count);
    int i=0;
    
    for (TuShangModel *model in self.dataSource) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(KscreenWidth*i, (KscreenHeight/4)+20, KscreenWidth,KscreenHeight/2-40)];
        NSLog(@"%@",model.url);
        [imageView setImageWithURL:[NSURL URLWithString:model.url]];
        imageView.contentMode =  UIViewContentModeScaleToFill;
        imageView.tag = i;
        //imageView.backgroundColor = [UIColor redColor];
        self.imageView = imageView;
        [self.scrollView addSubview:self.imageView];
        i++;
    }
   
    self.scrollView.contentSize = CGSizeMake(KscreenWidth*self.dataSource.count, KscreenHeight/2-40);

}

-(void)loadData{

    [self.manager requestWithUrl:_model.url option:BcRequestCenterCachePolicyCacheAndLocal parameters:nil complicate:^(BOOL success, id object) {
        NSLog(@"%@",_model.url);
       // NSLog(@"数据＝＝＝%@",object[0]);
         NSLog(@"数据＝＝＝%@",object);
        NSLog(@"%@",[object class]);
        [self.dataSource addObjectsFromArray:object];
 
        NSLog(@"myDatasource=====%@",self.dataSource);
        NSLog(@"%ld",self.dataSource.count);
       
    } modelClass:[TuShangModel class]];
    
}
//-(void)updateHeaderViewWithModels:(NSArray *)models{
//    
//    InformationHeaderView *view = [InformationHeaderView viewWithModels:models frame:CGRectMake(0, 0, KscreenWidth, 180)];
//    self.headerView = view;
//    [self tableViewWithType:ShouYe].tableHeaderView = self.headerView;
//    
//}

//-(void)setModels:(NSArray *)models{
//    
//    int i=0;
//    for (HeaderModel *model in _models) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
//        [button setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:model.image]];
//        button.tag = i;
//        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
//        self.button = button;
//        [self.scrollView addSubview:self.button];
//        i++;
//    }
//    
//    self.scrollView.contentSize = CGSizeMake(self.frame.size.width*_models.count, self.frame.size.height);
//    self.scrollView.pagingEnabled = YES;
//    self.page.numberOfPages = _models.count;
//    [self showModelAtIndex:0];
//    self.scrollView.delegate = self;
//}


#pragma mark scrollViewDelegate

//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    
//    if (self.scrollView == scrollView) {
//        
//        NSInteger index = self.scrollView.contentOffset.x/self.scrollView.frame.size.width;
//        
//        [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.frame.size.width, 0) animated:YES];
//   }
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
