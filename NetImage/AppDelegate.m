//
//  AppDelegate.m
//  NetImage
//
//  Created by JSH on 2020/8/16.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SHNewViewController.h"
#import "PageViewController.h"
#import "TableViewController.h"
#import "DetailViewController.h"
#import "SDWebImageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
//    ViewController *vc1 = [[ViewController alloc] init];
//    
//    
//    
//    SHNewViewController *vc2 = [SHNewViewController new];
//    PageViewController *vc3 = [PageViewController new];
    TableViewController *vc4 = [TableViewController new];
    DetailViewController *vc5 = [DetailViewController new];
    SDWebImageViewController *vc6 = [SDWebImageViewController new];
    
    UINavigationController *vc1_NA = [[UINavigationController alloc] initWithRootViewController:vc4];
    
//    UINavigationController *vc_to_pg = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    self.window.rootViewController = vc1_NA;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application{
    
}
- (void)applicationDidEnterBackground:(UIApplication *)application{
    
}
- (void)applicationWillEnterForeground:(UIApplication *)application{
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    
}
- (void)applicationWillTerminate:(UIApplication *)application{
    
}

@end
