//
//  AppDelegate.m
//  Vaccine
//
//  Created by Chakrit on 2/6/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "AppDelegate.h"

@import Firebase;


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [FIRApp configure];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  
}


- (void)applicationWillTerminate:(UIApplication *)application {
  
}


@end
