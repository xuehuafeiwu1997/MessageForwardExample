//
//  AppDelegate.m
//  消息转发机制测试
//
//  Created by xmy on 2021/2/22.
//

#import "AppDelegate.h"
#import "MessageForwardViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    MessageForwardViewController *vc = [[MessageForwardViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    return YES;
}

@end
