//
//  InformationModel.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-10.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"

@interface InformationModel : BaseModel

@property(nonatomic,copy)NSString <Optional> *channelId;
@property(nonatomic,copy)NSString <Optional> *channelName;
@property(nonatomic,copy)NSString <Optional> *title;
@property(nonatomic,copy)NSString <Optional> *count;
@property(nonatomic,copy)NSString <Optional> *image;
@property(nonatomic,copy)NSString <Optional> *url;
@property(nonatomic,copy)NSString  *Cid;
@property(nonatomic,copy)NSString <Optional> *pubDate;
@property(nonatomic,copy)NSString <Optional> *name;
@property(nonatomic,copy)NSString <Optional> *cover;
@property(nonatomic,copy)NSString <Optional> *photoCount;
@end
