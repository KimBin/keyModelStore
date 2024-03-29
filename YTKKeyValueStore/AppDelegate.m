//
//  AppDelegate.m
//  YTKKeyValueStore
//
//  Created by TangQiao on 10/3/14.
//  Copyright (c) 2014 TangQiao. All rights reserved.
//

#import "AppDelegate.h"
#import "YTKKeyValueStore.h"
#import "NewsItem.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Demo
    NSString *tableName = @"user_table";
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"test.db"];
    [store createTableWithName:tableName];
    NSString *key = @"1";
    NSDictionary *user = @{@"id": @1, @"name": @"tangqiao", @"age": @30};
    [store putObject:user withId:key intoTable:tableName];
    
    [store putNumber:@(45) withId:@"numID" intoTable:tableName];
    [store putString:@"yoyo" withId:@"strID" intoTable:tableName];
    
    NSDictionary *queryUser = [store getObjectById:key fromTable:tableName];
//    NSLog(@"query data result: %@", queryUser);
    
    NewsItem *news1 = [[NewsItem alloc]init];
    news1.title = @"猴赛雷";
    news1.writer = @"老爷子";
    news1.publisTime = @"猴年马月";
//    [store putModelObject:news1 withId:@"news1" intoTable:tableName];
    
    NewsItem *news2 = [[NewsItem alloc]init];
    news2.title = @"猴赛雷2";
    news2.writer = @"老爷子2";
    news2.publisTime = @"猴年马月2";
    [store putModelObjectArray:@[news1,news2] withIdArray:@[@"news1",@"news2"] intoTable:tableName];
    
    NewsItem *item = [store getModelObjectById:@"news1" className:[NewsItem class] fromTable:tableName];
    
    
    return YES;
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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
