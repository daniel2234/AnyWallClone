//
//  AppDelegate.m
//  AnyWallClone
//
//  Created by Daniel Kwiatkowski on 2015-05-12.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//
#import <Parse/Parse.h>


#import "AppDelegate.h"
#import "LoginViewController.h"
#import "WallViewController.h"

@interface AppDelegate () <LoginViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [Parse setApplicationId:@"wGW6XrvNL81P00VYNSIzwNor6CwqEkijTQUR4NGV"
                   clientKey:@"cDs1XTpM7hbbCuoWkbB52d2dmqeJcm6skkR0YEM8"];

    return YES;
}

-(void)presentLoginViewController{
    //Go to the login account and create an account
    LoginViewController *viewController = [[LoginViewController alloc]init];
    viewController.delegate = self;
    [self.navigationController setViewControllers:@[viewController] animated:NO];
}

-(void)loginViewControllerDidLogin:(LoginViewController *)controller{
    [self presentLoginViewControllerAnimated:YES];
}
//implement later
-(void) presentLoginViewControllerAnimated:(BOOL)animate{
//    WallViewController *wallViewController = [[WallViewController alloc]init];
//    wallViewController.de
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
