//
//  User.h
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-21.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * password;

@end
