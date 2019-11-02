//
//  AppDelegate.m
//  ComponentDemo
//
//  Created by 夷海科技 on 2019/10/10.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"


#import "YHRegisterVC.h"

#import "YHForgetPwdVC.h"

#import "YHHomeVC.h"

#import "YHMessageTVC.h"

#import "YHMainVc.h"


#import "YHViewController.h"


#import "YHDemoTest01.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    
    
    //   使用NSUserDefaults来判断程序是否第一次启动
    NSUserDefaults *TimeOfBootCount = [NSUserDefaults standardUserDefaults];
    if (![TimeOfBootCount valueForKey:@"time"]) {
        [TimeOfBootCount setValue:@"sd" forKey:@"time"];
//        NSLog(@"---第一次启动");
//        window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    }else{
//         window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[YHHomeVC alloc] init]];
//        NSLog(@"---不是第一次启动");
    }
    
//    NSLog(@"---启动成功");
    
   window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[YHDemoTest01 alloc] init]];
    
    self.window = window;
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
