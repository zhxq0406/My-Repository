//
//  MeViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "MeViewController.h"
#import "LoginViewController.h"
#import "MyFavoriteViewController.h"

@interface MeViewController ()<LoginDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property(nonatomic,assign)BOOL state;
@end

@implementation MeViewController

- (IBAction)collection:(id)sender {
    
    MyFavoriteViewController *vc = [[MyFavoriteViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

//登录注册
- (IBAction)clickButton:(id)sender {
    LoginViewController *vc = [[LoginViewController alloc]init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)sendMessage:(NSString *)username andState:(BOOL)isRegister{
    
    [self.me setTitle:[NSString stringWithFormat:@"欢迎%@使用",username] forState:UIControlStateNormal];
    [self createRightItemWithTitle:@"退出登陆"];
}

-(void)clickRight:(UIBarButtonItem *)item{

    [self createRightItemWithTitle:@""];
    [self.me setTitle:@"点击登陆/注册" forState:UIControlStateNormal];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createRightItemWithTitle:@""];
    //_btnHead.layer.masksToBounds = YES; _btnHead.layer.cornerRadius = 按钮宽的一半;
    self.headerImage.layer.masksToBounds = YES;
    _headerImage.layer.cornerRadius = 24;
    // Do any additional setup after loading the view from its nib.
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
