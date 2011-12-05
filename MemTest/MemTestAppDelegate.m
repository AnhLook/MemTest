//
//  MemTestAppDelegate.m
//  MemTest
//
//  Created by Anh on 11/29/11.
//  Copyright 2011 Looksys. All rights reserved.
//

#import "MemTestAppDelegate.h"

#import "MemTestViewController.h"
#import "constants.h"

@implementation MemTestAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;

@synthesize appData;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    /*
     Create an instance of AppData class.  
     Then use appData getter method to retain the pointer to this instance for later use.
     Finally, release 'data' because this is a temp pointer and we had used 'alloc' 
     to create it.  This will reduce the retain count by 1.
     */
    AppData *data = [[AppData alloc] init];
    self.appData = data;
    
    // Comment this out to artificially create a leak.
    [data release];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    
    [appData release];
    
    [super dealloc];
}


@end
