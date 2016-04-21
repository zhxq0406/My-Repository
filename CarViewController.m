//
//  CarViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "CarViewController.h"
#import "ChooseCarsViewController.h"
#import "UrlMacro.h"
#import "CarModel.h"
#import "CarCell.h"
#import "PopularBrandModel.h"
#import "PopularBrandCell.h"
#import "AFNetworking.h"

static NSString *collectionCell = @"collectionCell";
static NSString *cellId = @"cellID";

@interface CarViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray *indexs;
@property(nonatomic,strong)NSString *Cid;
@property(nonatomic,strong)NSMutableArray *PopularBrandArray;
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation CarViewController

-(NSMutableArray *)PopularBrandArray{

    if (_PopularBrandArray == nil) {
        _PopularBrandArray = [NSMutableArray array];
    }
    return _PopularBrandArray;

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.tableView.frame = [UIScreen mainScreen].bounds;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slider = (SliderViewController *)self.parentViewController.parentViewController;
    UINavigationController *nvc = [self.slider viewControllers][1];
    ChooseCarsViewController *vc = nvc.childViewControllers[0];
    self.delegate = vc;
    self.indexs = [NSMutableArray array];
    [self customTableView];
    [self loadData];
    [self registerTableView];
    
    [self createCollectionView];
    
    [self loadCollectionViewData];
    // Do any additional setup after loading the view from its nib.
}

-(void)registerTableView{

    [self.tableView registerNib:[UINib nibWithNibName:[NSString stringWithFormat:@"CarCell"] bundle:nil] forCellReuseIdentifier:cellId];
    [self.view addSubview:self.tableView];

}


#pragma mark createCollectionView

-(void)createCollectionView{

    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    flowLayOut.itemSize = CGSizeMake(self.view.bounds.size.width-50/4, 40);
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayOut];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionCell];
    //self.tableView.tableHeaderView.backgroundColor = [UIColor redColor];
    //self.tableView.tableHeaderView = self.collectionView;

}


-(void)loadCollectionViewData{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"html/text", nil]];
    
    [manager GET:PopularBrand parameters:nil success:^(AFHTTPRequestOperation *  operation, id   responseObject) {
        NSLog(@"responseObject =====  %@",responseObject);
        NSArray *array = responseObject[@"brands"];
        NSLog(@"%@",array);
        
    } failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
        //
       
        NSLog(@"%@",error);
        
    }];


}


-(void)loadData{

    [self.manager requestWithUrl:List option:BcRequestCenterCachePolicyCacheAndLocal parameters:nil complicate:^(BOOL success, id object) {
       
        self.dataSource = [[NSMutableArray alloc]init];
        [self.dataSource addObjectsFromArray:object];
        [self.tableView reloadData];
       
    } modelClass:[CarModel class]];

}

-(void)customTableView{
    
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
     self.tableView.separatorColor = [UIColor grayColor];

}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    CarModel *model = self.dataSource[indexPath.section][indexPath.row];
    if ([self.delegate respondsToSelector:@selector(getValue:)]) {
        [self.delegate getValue:model.Cid];
        
    }
    
    [self.slider showRightVC];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}

//返回组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CarCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    CarModel *model = self.dataSource[indexPath.section][indexPath.row];
    cell.model = model;
    cell.alpha = 0.5;
    return cell;
    
}

//返回某一组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataSource[section] count];

}

//返回组的头标
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSArray *models = self.dataSource[section];
    CarModel *model = models[0];
    NSString *title = model.letter;
    [self.indexs addObject:title];
    //[self.indexs removeObjectAtIndex:0];
    return title;

}


//返回索引的标题
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
 
    //NSArray *array1 = [NSArray arrayWithArray:self.indexs];
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.indexs];
   return array;
}


//通过索引标题或者索引的序号,和组号相匹配
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //参数是索引的标题和序号,返回值是匹配组的序号
    return index-1;
}


#pragma  mark  collectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.PopularBrandArray.count;
}

//返回对应的cell   创建或者刷新cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PopularBrandCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCell forIndexPath:indexPath];
   // NSLog(@"========%@",self.PopularBrandArray);
    //NSLog(@"++++++%@",self.PopularBrandArray[indexPath.row]);
    PopularBrandModel *model = self.PopularBrandArray[indexPath.row];
   // NSLog(@"------%@",model);
    cell.model = model;
    return cell;
    
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
