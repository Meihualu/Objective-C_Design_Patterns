//
//  DPMainTableViewModel.m
//  Design_Patterns_Demoes
//
//  Created by 周飞 on 2019/3/29.
//  Copyright © 2019年 zhf. All rights reserved.
//

#import "DPMainTableViewModel.h"

@implementation DPMainTableViewModel

NSArray *mainDataSource() {
    NSArray *source = @[@"对象创建型（5种）",@"对象去耦型（2种）",@"抽象集合型（2种）",
                        @"性能与对象访问型（2种）",@"对象状态型（1种）",@"行为扩展型（3种）",
                        @"算法封装型（3种）",@"接口适配型（3种）"];
    return source;
}



@end
