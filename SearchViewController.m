//
//  SearchViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-24.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "SearchViewController.h"
#import "ScreenMarco.h"
#import "UrlMacro.h"
#import "SearchModel.h"
#import "SearchTableViewCell.h"
#import "CarDetailViewController.h"

static NSString *cellID = @"cellID";

@interface SearchViewController ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property(nonatomic,strong)UISearchBar *searchBar;

@end

@implementation SearchViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationBar];
    self.tableView.frame = CGRectMake(0, 64, KscreenWidth, KscreenHeight-64);
   // [self createLeftItemWithTitle:@""];
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"SearchTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.tableFooterView = [[UIView alloc]init];
  
   
    // Do any additional setup after loading the view from its nib.
}


-(void)createNavigationBar{

    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 27, KscreenWidth-20, 30)];
    self.searchBar = searchBar;
    [self.searchBar setShowsCancelButton:YES animated:YES];
    self.searchBar.delegate = self;
    
    //self.navigationItem.titleView=searchBar;
    [self.navigationBar addSubview:self.searchBar];
}

-(void)loadData{

    NSString *str = [NSString stringWithFormat:@"%@%@",Search,self.searchBar.text];
    
     NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)str,NULL,NULL,kCFStringEncodingUTF8));
    [self.manager requestWithUrl:encodedString option:BcRequestCenterCachePolicyNormal parameters:nil complicate:^(BOOL success, id object) {
        if (success) {
            self.dataSource = nil;
            [self.dataSource addObjectsFromArray:object];
            [self.tableView reloadData];
        }
        
    } modelClass:[SearchModel class]];

}


#pragma mark tableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CarDetailViewController *vc = [[CarDetailViewController alloc]init];
    //ChoseCarsModel *model = self.dataSource[indexPath.row];
    vc.serialmodel= self.dataSource[indexPath.row];
    [self presentViewController:vc animated:YES completion:^{
        NSLog(@"推出成功");
    }];
    // [self.parentViewController.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark searchDelegate

//将要开始编辑
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{

    //显示取消按钮
    //[searchBar setShowsCancelButton:YES animated:YES];
    return YES;

}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //点击搜索按钮,放弃第一响应
    [searchBar resignFirstResponder];
    [self loadData];
    
}

//点击取消按钮
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{

    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回成功");
    }];

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
