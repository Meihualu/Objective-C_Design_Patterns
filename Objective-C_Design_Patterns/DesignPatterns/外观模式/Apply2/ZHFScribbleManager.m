//
//  ZHFScribbleManager.m
//  Objective-C_Design_Patterns
//
//  Created by 周飞 on 2018/12/8.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "ZHFScribbleManager.h"
#import <BottomComponentLib/FileManager.h>

#define kScribblePath [NSHomeDirectory() stringByAppendingString:@"/Documents/ScribbleData"]
#define kScribbleModelPath [kScribblePath stringByAppendingPathComponent:@"model"]
#define kScribbleThumbnailPath [kScribblePath stringByAppendingPathComponent:@"thumbnail"]


@implementation ZHFScribbleManager
SingletonM(ZHFScribbleManager)
- (instancetype)init
{
    self = [super init];
    if (self) {
        [FileManager createDir:kScribblePath];
        [FileManager createDir:kScribbleModelPath];
        [FileManager createDir:kScribbleThumbnailPath];
    }
    return self;
}

- (void)saveScribble:(ZHFScribble *)scrbble thumbnail:(UIImage *)image {
    //为当前存储的涂鸦数据和截图获取新的索引值
    NSInteger newIndex = [self numberOfScribbles];
    //根据索引值生成涂鸦数据名和截图名
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%d",newIndex];
    NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%d",newIndex];
    
    
    //从涂鸦获得备忘录，然后存储到本地
    ZHFScribbleMemento *mem = [scrbble scribbleMemento];
    NSData *mementoData = [mem data];
    NSString *memPath = [NSString stringWithFormat:@"%@/%@.modelData",kScribbleModelPath,scribbleDataName];
    [FileManager saveData:mementoData toPath:memPath];
    
    //把缩略图保存到文件系统
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *scribbleThumbnailPath = [NSString stringWithFormat:@"%@/%@.imageData",kScribbleThumbnailPath,scribbleThumbnailName];
    [FileManager saveData:imageData toPath:scribbleThumbnailPath];
}

- (ZHFScribble *)scribbleAtIndex:(NSInteger)index {
    //根据索引值生成涂鸦数据名和截图名
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%d",index];
    NSString *memPath = [NSString stringWithFormat:@"%@/%@.modelData",kScribbleModelPath,scribbleDataName];
    
    NSData *mementoData = [FileManager readObjetFromPath:memPath];
    ZHFScribbleMemento *memento = [ZHFScribbleMemento mementoWithData:mementoData];
    ZHFScribble *scribble = [ZHFScribble scribbleWithMemento:memento];
    return scribble;
}

//TODO: 等待填充
- (NSInteger)numberOfScribbles {
    NSArray *objs = [FileManager readObjetsFromPath:kScribbleModelPath];
    return [objs count];
}


#pragma mark - private method

@end
