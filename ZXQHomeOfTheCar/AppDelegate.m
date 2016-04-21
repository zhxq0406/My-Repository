//
//  AppDelegate.m
//  ZXQHomeOfTheCar
//
//  Created by MS on 16-1-9.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "AppDelegate.h"
#import "RootVCManager.h"
#import "UMSocial.h"
#import "MagicalRecord.h"
#import "EAIntroPage.h"
#import "EAIntroView.h"
#import <UIKit/UIKit.h>
@interface AppDelegate ()
@property (strong, nonatomic) NSURLCache *urlCache;
@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    self.urlCache = [[NSURLCache alloc]initWithMemoryCapacity:2 * 1024 * 1024 diskCapacity:100 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:self.urlCache];
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"MYsqlite.sqlite"];
    
    //友盟分享
    [UMSocialData setAppKey:@"569eeae2e0f55a33e4000ee5"];
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [RootVCManager rootVC];
    //[self showBasicIntroWithBg];
    return YES;
}

- (void)showBasicIntroWithBg {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    page1.titleImage = [UIImage imageNamed:@"2.jpg"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
    page2.titleImage = [UIImage imageNamed:@"supportcat"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
    page3.titleImage = [UIImage imageNamed:@"femalecodertocat"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.window.bounds andPages:@[page1,page2,page3]];
    //intro.bgImage = [UIImage imageNamed:@"introBg"];
    
    //[intro setDelegate:self];
    [intro showInView:self.window animateDuration:0.0];
}







- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    //[MagicalRecord cleanUp];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
