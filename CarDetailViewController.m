//
//  CarDetailViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "CarDetailViewController.h"
#import "RequestManager.h"
#import "TitleView.h"
#import "UrlMacro.h"
#import "ScreenMarco.h"
#import "CarModel.h"
#import "ZongShuModel.h"
#import "ZongShuCell.h"
#import "Sales.h"
#import "SalesData.h"
#import "PhotoCell.h"
#import "ImageModel.h"
#import "AFNetworking.h"
#import "CanPeiCell.h"
#import "HeaderView.h"

static NSString *collectionCellID = @"collectionCellID";
static NSString *zongshucellID = @"zongshucellID";
static NSString *canpeicellID = @"canpeicellID";
static NSString *tupiancellID = @"tupiancellID";
#define  TableViewTag   10
typedef enum titleType{
    ZongShu = 0,
    CanPei,
    TuPian,
    JingXiaoShang,
    
}TitleType;

@interface CarDetailViewController ()<TitleViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
{
    
    NSInteger _page[5];
    
}

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;



@property(nonatomic,strong)TitleView * titleView;
@property(nonatomic,strong)NSMutableArray * dataSources;//存放数据源数组
@property(nonatomic,strong)NSMutableArray *HeaderViewDataSource;

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *refreshs;
@property(nonatomic,strong)NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *CanPeiArray;
@property(nonatomic,strong)NSMutableArray *TuPianArray;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,strong)AFHTTPRequestOperationManager *CanPeiManager;

@end



@implementation CarDetailViewController
- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回成功");
    }];
}

-(AFHTTPRequestOperationManager *)CanPeiManager{

    if (_CanPeiManager == nil) {
        
        _CanPeiManager = [AFHTTPRequestOperationManager manager];
        
        _CanPeiManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    }
    return _CanPeiManager;
}
-(NSMutableArray *)TuPianArray{

    if (_TuPianArray == nil) {
        _TuPianArray = [NSMutableArray array];
    }
    return _TuPianArray;
}

-(NSMutableArray *)CanPeiArray{

    if (_CanPeiArray == nil) {
        _CanPeiArray = [NSMutableArray array];
    }
    return _CanPeiArray;
}

-(NSMutableArray *)array {

    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

-(void)viewWillAppear:(BOOL)animated{

    self.view.center = CGPointMake(1.5*self.view.frame.size.width, self.view.frame.origin.y);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.refresh.topEnabled = NO;
    self.refresh.bottomEnabled = NO;
    [self createTitle];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self createScrollView];
    [self createTableView];//创建tableView
    [self loadZonShuData];
    [self loadCanPeiData];
    [self loadDataWithType:TuPian refresh:YES];
    
}


-(void)loadZonShuData{
 
    NSString * urlstr = nil;
    urlstr = [NSString stringWithFormat:@"%@%@",CarDetailUrl,self.serialmodel.Cid];
 
    NSLog(@"myurl=====%@",urlstr);
    
    //请求
    [self.manager requestWithUrl:urlstr option:BcRequestCenterCachePolicyCacheAndLocal parameters:nil complicate:^(BOOL success, id object) {
        //
        NSLog(@"%d",success);
        if (success) {
            
            [self.array addObjectsFromArray:object];
            
            //刷新对应的tableView
            //[self createCollectionView];
            [self updateHeaderViewWithModels:[object firstObject]];
            UITableView *tableView = (id)[self.view viewWithTag:10];
            [tableView reloadData];
        }
    } modelClass:[ZongShuModel class]];
}

-(void)loadCanPeiData{

    NSString * urlstr = nil;
    urlstr = [NSString stringWithFormat:@"%@%@",CanPeiUrl,self.serialmodel.Cid];
    [self.CanPeiManager GET:urlstr parameters:nil success:^(AFHTTPRequestOperation *  operation, id   responseObject) {
        
        NSArray *detailArray = responseObject[@"detailArray"];
        NSDictionary *dict = [detailArray firstObject];
        [self.CanPeiArray addObjectsFromArray:dict[@"detail"]];
        UITableView *tableView = (id)[self.view viewWithTag:11];
        [tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
        NSLog(@"%@",error);
        
    }];
}


//更新 headerview显示的内容
-(void)updateHeaderViewWithModels:(ZongShuModel*)model{
    
    HeaderView * view = [HeaderView viewWithModels:model frame:CGRectMake(0, 0, KscreenWidth,250)];
    UITableView *tableView = (id)[self.view viewWithTag:10];
    tableView.tableHeaderView = view;
}

//-(void)createHeaderView{
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.scrollView.bounds.size.width, 220)];
//    button.backgroundColor = [UIColor redColor];
//    ZongShuModel *model = [self.array firstObject];
//    
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.photo_400x300]];
//    [button setImage:[[UIImage imageWithData:data] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    UITableView *tableView = (id)[self.view viewWithTag:10];
//    tableView.tableHeaderView = button;
//    
//}

-(void)createScrollView{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 108, KscreenWidth, KscreenHeight-108)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = [UIColor orangeColor];
   
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height);
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
   
}

- (void)createTableView{
    
    for (int i = 0; i < 2; i ++) {

        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(i*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) style:UITableViewStylePlain];
       
        tableView.tag = i + TableViewTag;
        tableView.delegate = self;
        tableView.dataSource = self;
        if (i == 0) {
            [tableView registerNib:[UINib nibWithNibName:@"ZongShuCell" bundle:nil] forCellReuseIdentifier:zongshucellID];
        }else if (i == 1){
            
            [tableView registerNib:[UINib nibWithNibName:@"CanPeiCell" bundle:nil] forCellReuseIdentifier:canpeicellID];
        }
        tableView.tableFooterView = [[UIView alloc]init];
        [self.scrollView addSubview:tableView];
        
    }
    
}

-(void)createCollectionView{

    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
                flowLayOut.itemSize = CGSizeMake(self.view.bounds.size.width-50/4, 40);
                UICollectionView *collection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayOut];
                collection.delegate = self;
                collection.dataSource = self;
                [collection registerClass:[PhotoCell class] forCellWithReuseIdentifier:collectionCellID];
                self.collectionView = collection;
                self.collectionView.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:self.collectionView];
    NSLog(@"-----%@",self.scrollView.subviews);
}

-(void)createTitle{
    
    TitleView * titleView = [[TitleView alloc] initWithFrame:CGRectMake(0, 64, KscreenWidth , 44)];
    titleView.titles = @[@"综述",@"参配",@"图片"];
    titleView.delegate = self;
    self.titleView = titleView;
    [self.view addSubview:titleView];
    
}
#pragma mark 网络请求

-(void)loadDataWithType:(TitleType)type refresh:(BOOL)isRefresh {
    
        //请求
    [self.manager requestWithUrl:photoUrl  option:BcRequestCenterCachePolicyCacheAndLocal parameters:nil complicate:^(BOOL success, id object) {
            //
            NSLog(@"%d",success);
            if (success) {
               
                [self.TuPianArray addObjectsFromArray:object];
                
            }
        } modelClass:[ImageModel class]];
    
}

//返回组数

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView.tag == 10) {
        ZongShuModel *model = [self.array firstObject];
        NSArray *model2 = model.sales;
        return model2.count;
    }else if (tableView.tag == 11){
    
        return self.CanPeiArray.count;
    
    }else if (tableView.tag == 12){
    
        return self.TuPianArray.count;
    }
    return 10;
    
}

//返回组的头标

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (tableView.tag == 10) {
        
        ZongShuModel *model = [self.array firstObject];
        NSArray *model2 = model.sales;
        Sales *salesModel = model2[section];
        return salesModel.title;
        
    }else if(tableView.tag == 11){
    
        NSDictionary *dict = self.CanPeiArray[section];
        return dict[@"groupName"];
    
    }else if (tableView.tag == 12){
    
        ImageModel *model = self.TuPianArray[section];
        return model.title;
    }
    return nil;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView.tag - TableViewTag == 0) {
        
        ZongShuModel *model = [self.array firstObject];
        NSArray *model2 = model.sales;
        Sales * model3 = model2[0];
        return model3.data.count;
    }else if (tableView.tag == 11){
    
        NSDictionary *dict = self.CanPeiArray[section];
        NSArray *groupDetail = dict[@"groupDetail"];
        return groupDetail.count/2;
    }else if (tableView.tag == 12){
    
        return self.TuPianArray.count;
    }
    return 10;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 10) {
        return 90;
        
    }else if (tableView.tag == 11){
    
        NSDictionary *dict = self.CanPeiArray[indexPath.section];
        NSArray *groupDetail = dict[@"groupDetail"];
        
        //groupDetail[indexPath.row*2];
        //算文字的高度
        CGRect rect = [groupDetail[indexPath.row*2] boundingRectWithSize:CGSizeMake(KscreenWidth/2-10, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]} context:nil];
        return rect.size.height;
    }
    
    return 190;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (tableView.tag == 10) {
       
        ZongShuModel *model = [self.array firstObject];
        NSArray *model2 = model.sales;
        Sales * model3 = model2[0];
        ZongShuCell *cell = [tableView dequeueReusableCellWithIdentifier:zongshucellID forIndexPath:indexPath];
        if (indexPath.row < model3.data.count) {
            
            SalesData *model4 = model3.data[indexPath.row];
            cell.model = model4;
            //NSLog(@"%ld",indexPath.row);
            
        }
        
        return cell;
    
    }else if(tableView.tag == 11){
    
        CanPeiCell *cell = [tableView dequeueReusableCellWithIdentifier:canpeicellID forIndexPath:indexPath];
        NSDictionary *dict = self.CanPeiArray[indexPath.section];
        NSArray *groupDetail = dict[@"groupDetail"];
        
        NSInteger num = indexPath.row;
        
        for (NSInteger i=num; i<=groupDetail.count-2;) {
            
            cell.key.text = groupDetail[i+indexPath.row];
            cell.value.text = groupDetail[i+1+indexPath.row];
            num++;
            i= i+2;
            return cell;
        }
         num++;
       
        
    }else if(tableView.tag == 12){
    
        
        PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:tupiancellID forIndexPath:indexPath];
        //NSLog(@"index====%@",self.TuPianArray[indexPath.row]);
        //NSLog(@"######%ld",(long)indexPath.row);
        cell.model = self.TuPianArray[indexPath.row];
        return cell;
    }
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return 20;

}

-(UITableView  *)tableViewWithType:(TitleType)type{
    
    return [self.scrollView viewWithTag:type+TableViewTag];
    
}

#pragma mark titleViewDelegate
-(void)titleView:(TitleView *)view selectIndex:(NSInteger)index{
    
    [self.scrollView setContentOffset:CGPointMake(index*self.scrollView.frame.size.width, 0) animated:YES];
    if (index == 2) {
        
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(2*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) style:UITableViewStylePlain];
        
        tableView.tag = 2 + TableViewTag;
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerNib:[UINib nibWithNibName:@"PhotoCell" bundle:nil] forCellReuseIdentifier:tupiancellID];
        [self.scrollView addSubview:tableView];
    }
    
}

#pragma mark CollectionViewDelegate

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    
    return cell;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 6;

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
