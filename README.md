# CLRouter

CLRouter是一个URL路由库，带有一个简单的基于块的API。它的目的是使它非常容易处理复杂的URL方案在您的应用程序中，以最少的代码。

----------------------


![License](https://img.shields.io/github/license/coooliang/CLRouter)
![Version](https://img.shields.io/github/v/tag/coooliang/CLRouter)
![platforms](https://img.shields.io/cocoapods/p/CLRouter)
![language](https://img.shields.io/github/languages/top/coooliang/CLRouter)



### Getting Started ###

AppDelegate.m

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ...

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
```

```objc
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if([[CLRouter router]canRouteURL:url]){
        return [[CLRouter router]routeURL:url parameter:options];
    }
    return YES;
}
```