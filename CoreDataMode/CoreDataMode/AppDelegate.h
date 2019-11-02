//
//  AppDelegate.h
//  CoreDataMode
//
//  Created by 夷海科技 on 2019/10/30.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

