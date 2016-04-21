//
//  MyFavoriteViewController.m
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/13.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "MyFavoriteViewController.h"
#import "CollectionManager.h"
#import "CollectionCell.h"

static NSString *cellID = @"cellID";

@interface MyFavoriteViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的收藏";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"CollectionCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.view addSubview:self.tableView];
    [self loadData];
    [self createLeftItemWithTitle:@"返回"];
    // Do any additional setup after loading the view from its nib.
}

-(void)clickLeft:(UIBarButtonItem *)item{

    [self.navigationController popViewControllerAnimated:YES];

}

-(void)loadData{

    NSArray *array = [CollectionManager findAppALL];
    [self.dataSource addObjectsFromArray:array];
    NSLog(@"%@",self.dataSource);
    [self.tableView reloadData];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 110;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
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
