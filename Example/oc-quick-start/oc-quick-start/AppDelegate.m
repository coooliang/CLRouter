//// 
//  AppDelegate.m
//  
//  Created by ___ORGANIZATIONNAME___ on 2023/7/6
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "RouterHeader.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController *viewController = [[ViewController alloc]init];
    UINavigationController *root = [[UINavigationController alloc]initWithRootViewController:viewController];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:root];
    [self.window makeKeyAndVisible];
    
    [self addRoutes];
    return YES;
}

- (void)addRoutes {
    [[CLRouter router]addRoute:Home block:^(CLRouterBlockParam *blockParam) {
        NSLog(@"jump home obj = %@ , %@",blockParam.name,blockParam.info);
    }];
    
//    [[CLRouter router]removeRoute:Home];
    [[CLRouter router]removeRoutes:@[Home]];
    
    [[CLRouter router]addRoutes:@[Home,Fortune,Wallet,Account] block:^(CLRouterBlockParam *blockParam) {
        NSLog(@"click tab obj = %@ , %@",blockParam.name,blockParam.info);
    }];
    
    [[CLRouter router]addRoute:NextStep block:^(CLRouterBlockParam *blockParam) {
        NSLog(@"NextStep obj = %@ , %@",blockParam.name,blockParam.info);
    }];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if([[CLRouter router]canRouteURL:url]){
        return [[CLRouter router]routeURL:url parameter:options];
    }
    return YES;
}

@end
