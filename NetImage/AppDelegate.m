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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.设置窗口的根控制器
    ViewController *vc1 = [[ViewController alloc] init];
    
    
    UINavigationController *vc1_NA = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    
    SHNewViewController *vc2 = [SHNewViewController new];
    
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
