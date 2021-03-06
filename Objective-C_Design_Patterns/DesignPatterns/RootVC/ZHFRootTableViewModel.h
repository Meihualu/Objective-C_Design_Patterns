//
//  ZHFRootTableViewModel.h
//  Objective-C_Design_Patterns
//
//  Created by 周飞 on 2018/11/11.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Macro.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHFRootTableViewModel : NSObject
SingletonH(ZHFRootTableViewModel)
@property (nonatomic, strong) NSArray *dataSource;
@end

NS_ASSUME_NONNULL_END
