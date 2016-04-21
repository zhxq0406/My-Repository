//
//  ImageModel.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "BaseModel.h"
#import "photos.h"

@protocol photos <NSObject>


@end
@interface ImageModel : BaseModel

@property(nonatomic,copy)NSString *title;


@property(nonatomic,strong)NSArray<photos> *photos;

@end
