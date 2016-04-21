//
//  LoginViewController.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-21.
//  Copyright (c) 2016年 MS. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@protocol LoginDelegate <NSObject>

-(void)sendMessage:(NSString *)username andState:(BOOL)isRegister;

@end
@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *login;


@property(nonatomic,strong)id<LoginDelegate> delegate;
@end
