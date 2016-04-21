//
//  LunTanModel.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-19.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"



@interface LunTanModel : BaseModel

@property(nonatomic,copy)NSString *datatime;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *forum;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *replycount;
@property(nonatomic,strong)NSArray *topicimg;
@property(nonatomic,copy)NSString *forumId;
@property(nonatomic,copy)NSString *topicimgcount;
@property(nonatomic,copy)NSString *userface;
@end
