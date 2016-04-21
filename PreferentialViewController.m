//
//  PreferentialViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "PreferentialViewController.h"
#import "UrlMacro.h"
#import "YouHuiModel.h"
#import "YouHuiCell.h"
#import "ScreenMarco.h"
#import "DJRefresh.h"

static NSString *cellID = @"cellID";
@interface PreferentialViewController ()<MyDelegate>
@property(nonatomic,strong)UIView *cellView;
@property(nonatomic,assign)NSInteger pageNo;
@end

@implementation PreferentialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageNo = 1;
    self.refresh.topEnabled = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"YouHuiCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self loadDataWithRefresh:YES];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tableView.frame = CGRectMake(0, 0,KscreenWidth, KscreenHeight-49);
}

-(void)loadDataWithRefresh:(BOOL)isRefresh{

    if (isRefresh) {//刷新
        
        _pageNo = 1;//设置page
       
    }else {
        _pageNo ++;
        
    }
    NSString *url = [NSString stringWithFormat:@"%@%ld",YouHuiUrl,(long)self.pageNo];
    //NSLog(@"%@",url);
    [self.manager requestWithUrl:url option: BcRequestCenterCachePolicyNormal parameters:nil complicate:^(BOOL success, id object) {
        
        [self.refresh finishRefreshing];
        if (success) {
            
            if (isRefresh) {
                self.dataSource = nil;
            }
            
            [self.dataSource addObjectsFromArray:object];
            [self.tableView reloadData];
        }
        
    } modelClass:[YouHuiModel class]];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 110;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    return self.dataSource.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YouHuiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.delegate = self;
    cell.model = self.dataSource[indexPath.row];
    self.cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    self.cellView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.7];
    
    [cell.contentView addSubview:self.cellView];
    return cell;
    
}

#pragma mark DJRefreshDelegate

-(void)refresh:(DJRefresh *)refresh didEngageRefreshDirection:(DJRefreshDirection)direction{

    if (direction == DJRefreshDirectionTop) {
         self.tableView.frame = CGRectMake(0, 64,KscreenWidth, KscreenHeight-113);
        self.pageNo = 1;
        [self loadDataWithRefresh:YES];
    }else{
        self.pageNo ++;
        self.tableView.frame = CGRectMake(0, 64,KscreenWidth, KscreenHeight-113);
        [self loadDataWithRefresh:NO];
    }
}

-(void)addView:(UIView *)view{

    [self.view addSubview:view];

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
