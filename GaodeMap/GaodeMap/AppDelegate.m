//
//  AppDelegate.m
//  GaodeMap
//
//  Created by 夷海科技 on 2019/10/8.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "AppDelegate.h"
#import <AMapFoundationKit/AMapFoundationKit.h>

#import <AMapSearchKit/AMapSearchKit.h>
//#import <AMapFoundationKit/AMapFoundationKit.h>
//
//#import <AMapSearchKit/AMapSearchKit.h>
#import "SearchViewController.h"


#define KEYMAP @"fad1686ea999a5019c30a8eb981054cc"

/*
 *
 */



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"%s",__func__);
    
    [AMapServices sharedServices].apiKey = @"fad1686ea999a5019c30a8eb981054cc";
//    [AMapSearchServices sharedServices].apiKey = @"fad1686ea999a5019c30a8eb981054cc";

    
    
    [self sumWithA:0 B:0];
    
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:self.window.bounds];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[SearchViewController alloc] init]];
    
    
    
    self.window = window;
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


/**
 @param a 这是一个整型参数A
 @param b 这是一个整型参数B
 */
-(void)sumWithA:(int)a B:(int)b{

}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s",__func__);

    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%s",__func__);

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s",__func__);

    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s",__func__);

    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s",__func__);

    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
