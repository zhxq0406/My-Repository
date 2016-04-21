//
//  RegisterViewController.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-22.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "RegisterViewController.h"
#import "MagicalRecord.h"
#import "CoredataManager.h"
#import "User.h"
#import "UserModel.h"
@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UITextField *confirmpwd;

@property(nonatomic,strong)UIAlertController *alert;

@end

@implementation RegisterViewController

- (IBAction)clickRegister:(id)sender {
    
    
    NSArray * array =  [User MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"username=%@",self.username.text]];
   // NSLog(@"%ld",array.count);
    
    if(array.count == 0){
        
        if([self.pwd.text isEqualToString:self.confirmpwd.text]==YES){
            
            UserModel *model = [[UserModel alloc]init];
            model.username = self.username.text;
            model.password = self.pwd.text;
            [CoredataManager insertUser:model];
            
            self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
            [self.alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [self.navigationController popViewControllerAnimated:YES];
                
            }]];
            
            [self presentViewController:self.alert animated:YES completion:nil];
            
        }else{
            
            self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认密码不正确,请从新输入" preferredStyle:UIAlertControllerStyleAlert];
            [self.alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
              
                self.confirmpwd.text = nil;
              
            }]];
            
            [self presentViewController:self.alert animated:YES completion:nil];
        }
        
    }else{
        
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"MYsqlite.sqlite"];
        NSLog(@"%@",path);
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"警告" message:@"用户名已存在" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [alertView show];
        NSLog(@"用户已存在");
        
    }
    
}

//- (IBAction)register:(id)sender {
//    
//     NSArray * array =  [User MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"username=%@",self.username.text]];
//    NSLog(@"%ld",array.count);
//    
//    if(array.count == 0){
//        
//        if([self.pwd.text isEqualToString:self.confirmpwd.text]==YES){
//            
//            UserModel *model = [[UserModel alloc]init];
//            model.username = self.username.text;
//            model.password = self.pwd.text;
//            [CoredataManager insertUser:model];
//            
//        }else{
//        
//            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"警告" message:@"确认密码不正确,请从新输入" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//            [alertView show];
//        
//        }
//        
//     }else{
//        
//        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"MYsqlite.sqlite"];
//        NSLog(@"%@",path);
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"警告" message:@"用户名已存在" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//        [alertView show];
//        NSLog(@"用户已存在");
//    
//    }
//    
//}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.username resignFirstResponder];
    [self.pwd resignFirstResponder];
    [self.confirmpwd resignFirstResponder];

}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.registerButton setBackgroundImage:[UIImage imageNamed:@"btn_blue@2x.png"] forState:UIControlStateNormal];
    [self createLeftItemWithTitle:@"返回"];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}

-(void)clickLeft:(UIBarButtonItem *)item{

    [self.navigationController popViewControllerAnimated:YES];
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
