//
//  DPElement.m
//  Design_Patterns_Demoes
//
//  Created by 周飞 on 2019/7/10.
//  Copyright © 2019年 zhf. All rights reserved.
//

#import "DPElement.h"
#import "DPVisitor.h"

@implementation DPElement
- (void)acceptElement:(DPVisitor *)visitor {
    [visitor visitorConcreteA:self];
}
@end
