////
//  CLRouterDefinition.h
//  CLRouter
//  Created by coooliang on 2023/8/11
//

#import "CLRouterBlockParam.h"
#import <Foundation/Foundation.h>

@interface CLRouterDefinition : NSObject

@property(nonatomic, copy) NSString *url;

@property(nonatomic, copy) void (^handlerBlock)(CLRouterBlockParam *blockParam);

@end
