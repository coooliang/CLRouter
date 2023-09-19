////
//  CLRouter.m
//  CLRouter
//  Created by ___ORGANIZATIONNAME___ on 2023/8/1
//

#import "CLRouter.h"
#import "CLRouterDefinition.h"

@implementation CLRouter {
    NSMutableDictionary *_mutableRoutes;
}

// 单例
static CLRouter *instance = nil;
+ (id)router {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if ((self = [super init])) {
        _mutableRoutes = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return self;
}

- (BOOL)canRouteURL:(NSURL *)URL {
    if (!URL) return NO;
    CLRouterDefinition *defi = [_mutableRoutes objectForKey:URL.absoluteString];
    if (defi) {
        return YES;
    }
    return NO;
}

- (void)addRoute:(NSString *)url block:(void (^)(CLRouterBlockParam *blockParam))handlerBlock {
    NSParameterAssert([url isKindOfClass:[NSString class]]);
    if ([_mutableRoutes objectForKey:url]) {
        //        NSLog(@"🆑 ❌ url is contains");
        //        NSLog(@"🆑 ⛔️ url is contains");
        //        NSLog(@"🆑 ❗️ '%@' It's already set,It'll be overwritten.",url);
        NSLog(@"🆑 ⚠️ '%@' already set, It'll be overwritten.", url);
    }
    CLRouterDefinition *routerDefinition = [[CLRouterDefinition alloc] init];
    routerDefinition.url = url;
    routerDefinition.handlerBlock = handlerBlock;
    [_mutableRoutes setObject:routerDefinition forKey:url];
}

- (void)addRoutes:(NSArray<NSString *> *)urls block:(void (^)(CLRouterBlockParam *blockParam))handlerBlock {
    NSParameterAssert(urls != nil);
    NSParameterAssert([urls isKindOfClass:[NSArray class]]);
    if (urls.count > 0) {
        for (NSString *url in urls) {
            [self addRoute:url block:handlerBlock];
        }
    }
}

- (void)removeRoute:(NSString *)url {
    NSParameterAssert([url isKindOfClass:[NSString class]]);
    [_mutableRoutes removeObjectForKey:url];
}

- (void)removeRoutes:(NSArray *)urls {
    NSParameterAssert(urls != nil);
    NSParameterAssert([urls isKindOfClass:[NSArray class]]);
    if (urls.count > 0) {
        for (NSString *url in urls) {
            [self removeRoute:url];
        }
    }
}

#pragma mark - routes
- (BOOL)route:(NSString *)url {
    NSParameterAssert([url isKindOfClass:[NSString class]]);
    CLRouterDefinition *defi = [_mutableRoutes objectForKey:url];
    if (defi && defi.handlerBlock) {
        CLRouterBlockParam *blockParam = [[CLRouterBlockParam alloc] init];
        blockParam.name = url;
        defi.handlerBlock(blockParam);
        return YES;
    }
    return NO;
}

- (BOOL)route:(NSString *)url parameter:(NSObject *)parameter {
    NSParameterAssert([url isKindOfClass:[NSString class]]);
    CLRouterDefinition *defi = [_mutableRoutes objectForKey:url];
    if (defi && defi.handlerBlock) {
        CLRouterBlockParam *blockParam = [[CLRouterBlockParam alloc] init];
        blockParam.name = url;
        blockParam.info = parameter;
        defi.handlerBlock(blockParam);
        return YES;
    }
    return NO;
}

- (BOOL)routeURL:(NSURL *)URL {
    [self route:URL.absoluteString];
}

- (BOOL)routeURL:(NSURL *)URL parameter:(NSObject *)parameter {
    [self route:URL.absoluteString parameter:parameter];
}

@end
