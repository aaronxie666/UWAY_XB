//
//  AppDelegate.m
//  UWAY_XB
//
//  Created by Chang on 2019/8/7.
//  Copyright © 2019 Chang. All rights reserved.
//

#import "AppDelegate.h"
#import "loginViewController.h"
#import "dashboardViewController.h"
#import "communicateViewController.h"
#import "publishViewController.h"
#import "nowsViewController.h"
#import "userViewController.h"


@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initRootVC];
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


- (void) initRootVC{
    
    self.window.hidden = NO;
    
    loginViewController *login = [[loginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:login];
    
    //1.
    dashboardViewController *VC1 = [[dashboardViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:VC1];
    
    //    InfoViewController *VC2 = [[InfoViewController alloc] init];
    communicateViewController *VC2 = [[communicateViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:VC2];
    publishViewController *VC3 = [[publishViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:VC3];
    nowsViewController *VC4 = [[nowsViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:VC4];
    userViewController *VC5 = [[userViewController alloc] init];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:VC5];
    VC1.title = @"Hot";
    VC2.title = @"Communicate";
    VC3.title = @"Publish";
    VC4.title = @"Nows";
    VC5.title = @"User";
    
    NSArray *viewCtrs = @[nav1,nav2,nav3,nav4,nav5];
    
    
    self.rootTabbarCtr  = [[UITabBarController alloc] init];

    [self.rootTabbarCtr setViewControllers:viewCtrs animated:YES];
    
//    go to Login page/dashboard
//    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"LoginStatus"]){
//        self.window.rootViewController = login;
//    }else {
        self.window.rootViewController = self.rootTabbarCtr;
//    }
    
    
    UITabBar *tabbar = self.rootTabbarCtr.tabBar;
    tabbar.backgroundColor = UIColor.whiteColor;
    
    UITabBarItem *item1 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:2];
    UITabBarItem *item4 = [tabbar.items objectAtIndex:3];
    UITabBarItem *item5 = [tabbar.items objectAtIndex:4];
    

    
    
    item1.selectedImage = [[UIImage imageNamed:@"hot_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"hot_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    
    item2.selectedImage = [[UIImage imageNamed:@"communicate_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"communicate_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item2.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item3.selectedImage = [[UIImage imageNamed:@"publish_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"publish_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item3.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item4.selectedImage = [[UIImage imageNamed:@"nows_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item4.image = [[UIImage imageNamed:@"nows_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item4.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item5.selectedImage = [[UIImage imageNamed:@"user_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item5.image = [[UIImage imageNamed:@"user_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item5.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColor.blueColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    
}

-(void)onLogin{

    self.window.rootViewController = self.rootTabbarCtr;
    
}




@end
