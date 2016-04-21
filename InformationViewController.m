//
//  InformationViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "InformationViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "InformationDetailViewController.h"
#import "InformationCell.h"
#import "InformationHeaderView.h"
#import "DJRefresh.h"
#import "ScreenMarco.h"
#import "TitleView.h"
#import "UrlMacro.h"
#import "HeaderModel.h"
#import "TuShangCell.h"
#import "TuShangViewController.h"

static NSInteger tag;
static NSInteger currentIndex;
static NSString *cellID = @"cellID";
#define  TableViewTag   50
typedef enum titleType{
    ShouYe = 0,
    XinChe ,
    HangQing,
    YouJi,
    ShiPin,
    TuShang,
    
}TitleType;

@interface InformationViewController ()<UITableViewDataSource,UITableViewDelegate,TitleViewDelegate,DJRefreshDelegate,UIScrollViewDelegate>
{
    NSInteger _page[6];
}
@property(nonatomic,strong)TitleView * titleView;
@property(nonatomic,strong)NSMutableArray * dataSources;//存放数据源数组
@property(nonatomic,strong)NSMutableArray *HeaderViewDataSource;
@property(nonatomic,strong)InformationHeaderView *headerView;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *refreshs;
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation InformationViewController

-(void)createTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(refreshHeaderView) userInfo:nil repeats:YES];
}

-(void)refreshHeaderView{
    static int i=0;
    self.headerView.page.currentPage = i;
    [self.headerView.scrollView setContentOffset:CGPointMake(i * self.scrollView.bounds.size.width, 0) animated:YES];
    
    i++;
    if (i>5) {
        i=0;
    }
    
}

-(void)createTitle{
    
    TitleView * titleView = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth , 30)];
    titleView.titles = @[@"首页",@"新车",@"行情",@"游记",@"视频",@"图赏"];
    titleView.delegate = self;
    self.titleView = titleView;
    [self.view addSubview:titleView];
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    UIButton *button = self.titleView.buttons[currentIndex];
    button.selected = NO;
    [self.titleView clickButton:button];
   // NSLog(@"%ld",currentIndex);
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, self.view.frame.size.height);
    self.navigationController.navigationBar.translucent = NO;
    [self createTitle];
    [self createScrollView];
    [self startAnimationHud];//开始转动菊花
    [self loadDataWithType:ShouYe refresh:YES];
    [self loadHeaderData];
    [self createTimer];
    // Do any additional setup after loading the view from its nib.
}

-(void)createScrollView{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, KscreenWidth, KscreenHeight - 30)];
    self.scrollView.pagingEnabled = YES;
    [self createTableView];//创建tableView
    //self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*5, self.scrollView.frame.size.height);
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
}

- (void)createTableView{
    //实例化
    self.dataSources = [NSMutableArray array];
    self.refreshs = [NSMutableArray array];
    for (int i = 0; i < 6; i ++) {
        
        NSMutableArray * models = [NSMutableArray array];
        [self.dataSources addObject:models];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(i*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) style:UITableViewStylePlain];
        self.tableView.tag = i + TableViewTag;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
         [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([InformationCell class]) bundle:nil] forCellReuseIdentifier:cellID];
        if (i==5) {
            [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TuShangCell class]) bundle:nil] forCellReuseIdentifier:cellID];
        }
        [self.scrollView addSubview:self.tableView];
        //创建刷新
        DJRefresh *refresh = [[DJRefresh alloc]initWithScrollView:self.tableView delegate:self];
        refresh.topEnabled = YES;
        refresh.bottomEnabled = YES;
        [self.refreshs addObject:refresh];
    }
    
}



#pragma mark 网络请求

-(void)loadDataWithType:(TitleType)type refresh:(BOOL)isRefresh {
    
    [self startAnimationHud];//开始转动菊花
    
    if (isRefresh) {//刷新
        _page[type] = 1;//设置page
    }else {
        _page[type]++;
       
    }
    
    NSString * urlstr = nil;
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:@{@"pageNo":@(_page[type])}];
    
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)Market,NULL,NULL,kCFStringEncodingUTF8));
    
    switch (type) {
        case 0:
             urlstr = FirstUrl;
            break;
        case 1:
            urlstr = NewCar;
            break;
        case 2:
            //当URL中含有中文时,需要转码
            urlstr = encodedString;
            break;
        case 3:
            urlstr = YouJiUrl;
            break;
        case 4:
            urlstr = Video;
            break;
        case 5:
            urlstr = TuShangUrl;
        default:
            break;
    }

    //请求
    [self.manager requestWithUrl:urlstr option:BcRequestCenterCachePolicyCacheAndLocal parameters:dic complicate:^(BOOL success, id object) {
        //停止刷新
        DJRefresh *refresh = self.refreshs[type];
        [refresh finishRefreshing];
     
        if (success) {
            [self stopHud];//停止转动
            // 判断是不是刷新
            if (isRefresh) {
                [self.dataSources[type] removeAllObjects];
            }
            //添加数据
            [self.dataSources[type]  addObjectsFromArray:object];
            //刷新对应的tableView
            [[self tableViewWithType:type] reloadData];
           // NSLog(@"%@",object);
        }
    } modelClass:[InformationModel class]];
}


-(UITableView  *)tableViewWithType:(TitleType)type{
    
    return [self.scrollView viewWithTag:type+TableViewTag];
    
}

- (void)registerTableView{
    
    //    注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([InformationCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 100;
    [self.view addSubview:self.tableView];
    
}

#pragma mark tableViewDelegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *models = self.dataSources[tableView.tag - TableViewTag];
    return [models count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *models = self.dataSources[tableView.tag -TableViewTag];

    
    if (tableView.tag -TableViewTag == 5) {
        
        TuShangCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
         cell.model = models[indexPath.row];
       // NSLog(@"%@",cell.model.cover);
         return cell;
    }else{
        
        InformationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell.model = models[indexPath.row];
         return cell;
    }
    return nil;
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *models = self.dataSources[tableView.tag -TableViewTag];
    InformationModel * model = models[indexPath.row];
    
    //算文字的高度
    CGRect rect = [model.title boundingRectWithSize:CGSizeMake(KscreenWidth - 170, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:17]} context:nil];
    
    float height = 50 + rect.size.height;
    NSLog(@"%f",height);
    if (height>80) {
        return height;
    }else if (tableView.tag - TableViewTag == 5){
       return 210;
    }
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    InformationModel *model = self.dataSources[tableView.tag - TableViewTag][indexPath.row];
    
    InformationDetailViewController *vc = [[InformationDetailViewController alloc]init];
    vc.model = model;
    tag = tableView.tag - TableViewTag;
    if (tag == ShiPin) {
        vc.Vid = model.Cid;
        vc.tag =  tableView.tag - TableViewTag;
        currentIndex = tableView.tag - TableViewTag;
    }else if (tag == TuShang){
    
        TuShangViewController *vc = [[TuShangViewController alloc]init];
        vc.model = model;
        currentIndex = tableView.tag - TableViewTag;
        [self.navigationController pushViewController:vc
                                             animated:YES];
        return;
    }
    currentIndex = tableView.tag - TableViewTag;
    [self.navigationController pushViewController:vc animated:YES];

}



#pragma mark titleDelegate

-(void)titleView:(TitleView *)view selectIndex:(NSInteger)index{

    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.frame.size.width, 0) animated:YES];
    
    NSArray *models = self.dataSources[index];
    if ([models count] == 0) {
        [self loadDataWithType:(TitleType)index refresh:YES];
    }

}

#pragma mark loadHeaderData
-(void)loadHeaderData{

    self.HeaderViewDataSource = [NSMutableArray array];
    [self.manager requestWithUrl:FirstUrl option:BcRequestCenterCachePolicyCacheAndLocal parameters:nil complicate:^(BOOL success, id object) {
        
        if (success) {
            [_HeaderViewDataSource addObject:object];
            [self updateHeaderViewWithModels:object];
            
        }
        
    } modelClass:[HeaderModel class]];

}

-(void)updateHeaderViewWithModels:(NSArray *)models{

    InformationHeaderView *view = [InformationHeaderView viewWithModels:models frame:CGRectMake(0, 0, KscreenWidth, 180)];
    self.headerView = view;
    [self tableViewWithType:ShouYe].tableHeaderView = self.headerView;

}

#pragma mark DJRefreshDelegate

-(void)refresh:(DJRefresh *)refresh didEngageRefreshDirection:(DJRefreshDirection)direction{

    //找到请求的type
    TitleType type = (TitleType)(refresh.scrollView.tag - TableViewTag);
    if (direction == DJRefreshDirectionTop) {
        [self loadDataWithType:type refresh:YES];
    }else{
        [self loadDataWithType:type refresh:NO];
    }
}

#pragma mark scrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (self.scrollView == scrollView) {
        
        NSInteger index = self.scrollView.contentOffset.x/self.scrollView.frame.size.width;
        [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.frame.size.width, 0) animated:YES];
        NSArray *models = self.dataSources[index];
        if ([models count] == 0) {
            [self loadDataWithType:(TitleType)index refresh:YES];
        }
        [self.titleView clickButton:self.titleView.buttons[index]];

    }
    
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
