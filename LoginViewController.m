//
//  LoginViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-21.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "User.h"
#import "MagicalRecord.h"
#import "MeViewController.h"

@interface LoginViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property(nonatomic,strong)UIAlertController *alert;
@property(nonatomic,assign)BOOL isRegistering;


@end

@implementation LoginViewController

- (IBAction)login:(id)sender {
    
     NSArray * array =  [User MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"username=%@",self.username.text]];
    if (array.count == 0) {
        
         UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"警告" message:@"用户名不存在" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        alertView.delegate = self;
        alertView.tag = 1;
        [alertView show];
    }else {
    
        User *user = array[0];
        NSLog(@"%@",user.password);
        if ([self.password.text isEqualToString:user.password]) {
            
            self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"登陆成功" preferredStyle:UIAlertControllerStyleAlert];
            [self.alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                self.isRegistering = YES;
                [self.delegate sendMessage:self.username.text andState:self.isRegistering];
                [self.navigationController popViewControllerAnimated:YES];
                
            }]];
            [self presentViewController:self.alert animated:YES completion:nil];
  
        }else{
             UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"警告" message:@"密码错误" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
            alertView.tag = 3;
            alertView.delegate = self;
             [alertView show];
        }
    
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
         NSLog(@"你点击了OK%ld",buttonIndex);
    }
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.username resignFirstResponder];
    [self.password resignFirstResponder];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLeftItemWithTitle:@"返回"];
    [self createRightItemWithTitle:@"注册"];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];//设置文字颜色
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor redColor];//设置文字颜色
    [self.login setBackgroundImage:[UIImage imageNamed:@"btn_blue@2x.png"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view from its nib.
}

-(void)clickLeft:(UIBarButtonItem *)item{

    [self.navigationController popViewControllerAnimated:YES];//返回上一界面
}

-(void)clickRight:(UIBarButtonItem *)item{

    RegisterViewController *vc = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

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
