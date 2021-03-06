//
//  DPClient.h
//  Design_Patterns_Demoes
//
//  Created by zhoufei on 2019/6/13.
//  Copyright © 2019年 zhf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPAdapteProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DPClient : NSObject
+ (instancetype)sharedClient;

@property (nonatomic, strong) id<DPAdapteProtocol> adapteObj;

@end

NS_ASSUME_NONNULL_END
