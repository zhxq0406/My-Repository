//
//  InformationDetailViewController.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-10.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseViewController.h"
#import "InformationModel.h"

@interface InformationDetailViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *classification;

//@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic,strong)UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *Ctitle;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property(nonatomic,strong)InformationModel *model;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *Vid;
@property(nonatomic,assign)NSInteger *tag;
@end
