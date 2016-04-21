//
//  ChooseCarsViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-13.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "ChooseCarsViewController.h"
#import "ChoseCarsModel.h"
#import "ChoseCarsCell.h"
#import "UrlMacro.h"
#import "CarModel.h"
#import "RootVCManager.h"
#import "CarDetailViewController.h"
static NSString *cellID = @"cellID";

@interface ChooseCarsViewController ()<CarDelegate>

@end

@implementation ChooseCarsViewController

-(void)getValue:(NSString *)str{

    //清空数据源
   
    self.Cid = str;
   // NSLog(@"url=====%@",[NSString stringWithFormat:@"%@%@",CarCellList,self.Cid]);
    [self.manager requestWithUrl:[NSString stringWithFormat:@"%@%@",CarCellList,self.Cid] option:BcRequestCenterCachePolicyCacheAndLocal parameters:nil complicate:^(BOOL success, id object) {
        self.dataSource = nil;
        if (success) {
            
            [self.dataSource addObjectsFromArray:object];
            [self.tableView reloadData];
        }
       
    } modelClass:[ChoseCarsModel class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createLeftItemWithTitle:@""];
    self.tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-113);
    self.refresh.topEnabled = NO;
    self.refresh.bottomEnabled = NO;
    UIView *view = [[UIView alloc]initWithFrame:self.view.bounds];
    view.tag = 1;
    [self.view addSubview:view];
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChoseCarsCell" bundle:nil] forCellReuseIdentifier:cellID];
     self.tableView.userInteractionEnabled = YES;
  
    // Do any additional setup after loading the view from its nib.

}

-(void)viewDidDisappear:(BOOL)animated{

}

-(void)viewWillDisappear:(BOOL)animated{

}


//返回头标
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    ChoseCarsModel *model = self.dataSource[section];
    
    return model.name;

}

//返回组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
    
}


//返回某一组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    ChoseCarsModel *model = self.dataSource[section];
    return  [model.serials count];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ChoseCarsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    ChoseCarsModel *model = self.dataSource[indexPath.section];
    cell.model= model.serials[indexPath.row];
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    CarDetailViewController *vc = [[CarDetailViewController alloc]init];
    ChoseCarsModel *model = self.dataSource[indexPath.section];
    vc.serialmodel= model.serials[indexPath.row];
    [self presentViewController:vc animated:YES completion:^{
        NSLog(@"推出成功");
    }];
   // [self.parentViewController.navigationController pushViewController:vc animated:YES];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
    
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    //self.view.center = CGPointMake(self.view.frame.origin.x, self.view.frame.origin.y);

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
