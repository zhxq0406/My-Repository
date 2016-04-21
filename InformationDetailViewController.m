//
//  InformationDetailViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-10.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "InformationDetailViewController.h"
#import "InformationDetailModel.h"
#import "UrlMacro.h"
#import "InformationViewController.h"
#import "ScreenMarco.h"
#import "UMSocial.h"
#import "CollectionManager.h"
#import "CollectionManager.h"
#import "AppLocal.h"
#import "MagicalRecord.h"

@interface InformationDetailViewController ()<UIWebViewDelegate,UMSocialDataDelegate,UMSocialUIDelegate>
{

    NSString *url;

}

@property (strong,nonatomic)NSString *currentHTML;

@end

@implementation InformationDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth, KscreenHeight-64)];
    self.tabBarController.tabBar.hidden = YES;
    self.Ctitle.text = self.model.title;
    self.date.text = self.model.pubDate;
    self.url = self.model.url;
    [self loadData];
    self.webView.scalesPageToFit = YES;//webview内容缩放到适应大小
    self.webView.delegate = self;
    [self createLeftItemWithTitle:@"返回"];
    [self createRightItem];
    [self.view addSubview:self.webView];
    
    NSArray *array = [AppLocal MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"cid=%@",_model.Cid]];
    NSLog(@"%ld",array.count);
    if (array.count!=0) {
        UIBarButtonItem *leftItem =  self.navigationItem.rightBarButtonItems[1];
        UIButton *button = leftItem.customView;
        [button setTitle:@"已收藏" forState:UIControlStateNormal];
        leftItem.enabled = NO;
    }
}

-(void)clickLeft:(UIBarButtonItem *)item{
   

    [self.navigationController popViewControllerAnimated:YES];

}

-(void)createRightItem{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 40);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"分享" forState:UIControlStateNormal];
    button.tag = 1;
    [button addTarget:self action:@selector(clickRight:) forControlEvents:UIControlEventTouchUpInside];
    //[button setTintColor:[UIColor blueColor]];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, 60, 40);
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //button1.backgroundColor = [UIColor blueColor];
    [button1 setTitle:@"收藏" forState:UIControlStateNormal];
    button1.tag = 2;
    [button1 addTarget:self action:@selector(clickRight:) forControlEvents:UIControlEventTouchUpInside];
    //[button1 setTintColor:[UIColor blueColor]];
    
    //自定义样式
    //创建右边item
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    //[item1 setTitleTextAttributes:@{UITextAttributeTextColor: [UIColor redColor]} forState:UIControlStateNormal];
    //self.navigationItem.rightBarButtonItem = item;
    self.navigationItem.rightBarButtonItems = @[item,item1];
    //NSLog(@"%@",[button titleForState:UIControlStateNormal]);
    
}

-(void)clickRight:(UIBarButtonItem *)item{
     NSLog(@"%ld",item.tag);
     NSString *title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if (item.tag == 1) {
        
         [UMSocialSnsService presentSnsIconSheetView:self appKey:@"569eeae2e0f55a33e4000ee5" shareText:[NSString stringWithFormat:@"%@%@",title,self.url] shareImage:nil shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,nil] delegate:self];
    }else if (item.tag == 2){
        
        //NSLog(@"%@",[item titleTextAttributesForState:UIControlStateNormal]);
       // NSDictionary *dict = [item titleTextAttributesForState:UIControlStateNormal];
       
        UIBarButtonItem *leftItem =  self.navigationItem.rightBarButtonItems[1];
        UIButton *button = leftItem.customView;
         NSLog(@"%@",button.titleLabel.text);
        if ([button.titleLabel.text isEqualToString:@"收藏"]) {
            
            InformationModel *appModel = [[InformationModel alloc]init];
            appModel.title = _model.title;
            appModel.image = _model.image;
            appModel.url = _model.url;
            appModel.Cid = _model.Cid;
            [CollectionManager insertApp:appModel];
            [button setTitle:@"已收藏" forState:UIControlStateNormal];
            
        }
    }

}

-(void)loadData{
    
    //视频页
    if (self.tag == 4) {
       
          [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoDetail,self.Vid]]]];//加载htmlstr
    }
    //其他页
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",InforMationDetailUrl,self.url]);
    [self.manager requestWithUrl:[NSString stringWithFormat:@"%@%@",InforMationDetailUrl,self.url] option:BcRequestCenterCachePolicyCacheAndLocal parameters:nil complicate:^(BOOL success, id object) {
        if (success) {
            
            NSDictionary * model = object[0];
            self.url = model[@"turl"];
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model[@"turl"]]]];//加载htmlstr
            
        }else{
        
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误信息" message:@"数据加载失败" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
            [self.view addSubview:alert];
        
        }
      
        
    } modelClass:[InformationDetailModel class]];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

    
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('crumbs').remove()"];
    
}


-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
   
}

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
