//
//  BaseViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseViewController.h"
#import "SearchViewController.h"

@implementation BaseViewController


-(MBProgressHUD *)hud{
    
    if (_hud == nil) {
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        
        [self.view addSubview:_hud];//添加到视图上
    }
    
    return _hud;
    
}

-(void)startAnimationHud{
    
    //设置显示样式 菊花样式
    _hud.mode = MBProgressHUDModeIndeterminate;
    
    [self.hud show:YES];//显示菊花
    
}

-(void)stopHud{
    
    [self.hud hide:YES];//隐藏
    
}


-(RequestManager *)manager{
    
    if (_manager == nil) {
        _manager = [[RequestManager alloc]init];
        
    }
    return _manager;
}


-(UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _refresh = [[DJRefresh alloc] initWithScrollView:_tableView delegate:self];
        _refresh.topEnabled = YES;
        _refresh.bottomEnabled = YES;
        
    }
    
    return _tableView;
    
}

- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(void)createLeftItem{

    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 30);
    [button setBackgroundImage:[UIImage imageNamed:@"btn_search@2x.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickLeftSearch:) forControlEvents:UIControlEventTouchUpInside];
    //自定义样式
    //创建右边item
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = item;

}

-(void)clickLeftSearch:(UIBarButtonItem *)item{

    SearchViewController *svc = [[SearchViewController alloc]init];
    [self presentViewController:svc animated:YES completion:^{
        NSLog(@"推出成功");
    }];
    //[self.navigationController pushViewController:svc animated:YES];
    

}

-(void)createLeftItemWithTitle:(NSString *)title{

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //[button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickLeft:) forControlEvents:UIControlEventTouchUpInside];
    //自定义样式
    //创建右边item
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = item;
}


-(void)createRightItemWithTitle:(NSString*)title{

    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(clickRight:)];
    
    self.navigationItem.rightBarButtonItem = item;
    
}
-(void)clickLeft:(UIBarButtonItem *)item{
    
}

-(void)clickRight:(UIBarButtonItem *)item{
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bth_serial_subscription@2x.png"] forBarMetrics:UIBarMetricsDefault];
    [self createLeftItem];
   
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //self.tabBarController.tabBar.hidden = NO;
    
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
