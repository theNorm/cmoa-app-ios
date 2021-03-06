//
//  CIAppDelegate.m
//  International
//
//  Created by Dimitry Bentsionov on 7/3/13.
//  Copyright (c) 2013 Carnegie Museums. All rights reserved.
//

#import "CIAppDelegate.h"
#import "TestFlight.h"

@implementation CIAppDelegate

@synthesize analyticsTracker;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Back main window bg color to white. Helps with custom view transitions
    self.window.backgroundColor = [UIColor whiteColor];

    // Verify API config file presence
    NSString* settingsFilePath = [[NSBundle mainBundle] pathForResource:@"settings"
                                                                 ofType:@"plist"];
    assert([[NSFileManager defaultManager] fileExistsAtPath:settingsFilePath]);

    // Prepare MagicalRecord (CoreData): Uses versioned file names. Ex: CIData-1.2.1.sqlite
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [MagicalRecord setupCoreDataStackWithStoreNamed:[NSString stringWithFormat:@"CIData-%@.sqlite", appVersion]];
    
    // TestFlight setup
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:settingsFilePath];
    [TestFlight takeOff:[settings objectForKey:kCISettingsTestflightId]];
    
    // Google Analytics setup
    self.analyticsTracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-43659554-1"];
    
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