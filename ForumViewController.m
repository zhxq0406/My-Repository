//
//  ForumViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "ForumViewController.h"
#import "LunTanCell.h"
#import "LunTanCell2.h"
#import "UrlMacro.h"
#import "LunTanModel.h"
//#import "topicimg.h"
#import "ScreenMarco.h"

static NSString *cellID1 = @"cellID1";
static NSString *cellID2 = @"cellID2";
@interface ForumViewController ()

@end

@implementation ForumViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tableView.frame = CGRectMake(0, 0,KscreenWidth, KscreenHeight);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startAnimationHud];//开始转动菊花
    [self.tableView registerNib:[UINib nibWithNibName:@"LunTanCell" bundle:nil] forCellReuseIdentifier:cellID1];
    [self.tableView registerNib:[UINib nibWithNibName:@"LunTanCell2" bundle:nil] forCellReuseIdentifier:cellID2];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.navigationController.navigationBarHidden = NO;
    [self loadData];
    // Do any additional setup after loading the view from its nib.
}

-(void)loadData{

    [self.manager requestWithUrl:LunTan option:BcRequestCenterCachePolicyNormal parameters:nil complicate:^(BOOL success, id object) {
        
        [self stopHud];//停止转动
        [self.dataSource addObject:object];
        
    } modelClass:[LunTanModel class]];
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSArray *array = [self.dataSource firstObject];
    return array.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LunTanModel *model = [self.dataSource firstObject][indexPath.row];
    
    
    if (model.topicimg.count!=0) {
        LunTanCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
        cell.model = model;
        cell.num = model.topicimgcount;
        return cell;
    }else{
    
        LunTanCell2 *cell = [tableView dequeueReusableCellWithIdentifier:cellID2 forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    LunTanModel *model = [self.dataSource firstObject][indexPath.row];
    
    //算文字的高度
    
    CGRect rect = [model.desc boundingRectWithSize:CGSizeMake(KscreenWidth - 100, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]} context:nil];
    float height = 180 + rect.size.height;
    return  height;

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
