////
//  CLRouter.h
//  CLRouter
//  Created by coooliang on 2023/8/1
//

#import "CLRouterBlockParam.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CLRouter : NSObject

+ (id)router;

- (void)addRoute:(NSString *)url block:(void (^)(CLRouterBlockParam *blockParam))handlerBlock;
- (void)addRoutes:(NSArray<NSString *> *)urls block:(void (^)(CLRouterBlockParam *blockParam))handlerBlock;
- (void)removeRoute:(NSString *)url;
- (void)removeRoutes:(NSArray *)urls;

- (BOOL)route:(NSString *)url;
- (BOOL)route:(NSString *)url parameter:(NSObject *)parameter;

- (BOOL)canRouteURL:(NSURL *)URL;
- (BOOL)routeURL:(NSURL *)url;
- (BOOL)routeURL:(NSURL *)url parameter:(NSObject *)parameter;

@end
