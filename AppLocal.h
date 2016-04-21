//
//  AppLocal.h
//  
//
//  Created by zxq on 16/4/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AppLocal : NSManagedObject

@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * cid;

@end
