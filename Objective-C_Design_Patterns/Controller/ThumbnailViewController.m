//
//  ThumbnailViewController.m
//  Objective-C_Design_Patterns
//
//  Created by zhoufei on 2018/10/4.
//  Copyright © 2018年 周飞. All rights reserved.
//

#import "ThumbnailViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "ZHFScribbleManager.h"

@interface ThumbnailViewController ()
@property (nonatomic, strong) NSMutableArray *groupArrays;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ThumbnailViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = @[].mutableCopy;
    
//    [self testRun];
    
    [self setupData];
}

- (NSMutableArray *)groupArrays {
    if (!_groupArrays) {
        _groupArrays = @[].mutableCopy;
    }
    return _groupArrays;
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"fromThumbnail" sender:nil];
}

- (void)testRun
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
            if (group != nil) {
                [weakSelf.groupArrays addObject:group];
            } else {
                [weakSelf.groupArrays enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    [obj enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                        if ([result aspectRatioThumbnail] != nil) {
                            // 照片
                            if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]){
                                
                                NSDate *date= [result valueForProperty:ALAssetPropertyDate];
                                UIImage *image = [UIImage imageWithCGImage:[result aspectRatioThumbnail]];
                                NSString *fileName = [[result defaultRepresentation] filename];
                                NSURL *url = [[result defaultRepresentation] url];
                                int64_t fileSize = [[result defaultRepresentation] size];
                                
                                NSLog(@"date = %@",date);
                                NSLog(@"fileName = %@",fileName);
                                NSLog(@"url = %@",url);
                                NSLog(@"fileSize = %lld",fileSize);
                                
                                [self.dataSource addObject:image];
                            }
                            // 视频
                            else if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo] ){
                                
                                // 和图片方法类似
                            }
                        }
                    }];
                }];
                
                // UI的更新记得放在主线程,要不然等子线程排队过来都不知道什么年代了,会很慢的
                dispatch_async(dispatch_get_main_queue(), ^{
                    //TODO: 设置UI
                    [self.collectionView reloadData];
                });
            }
        };
        
        ALAssetsLibraryAccessFailureBlock failureBlock = ^(NSError *error)
        {
            
            NSString *errorMessage = nil;
            
            switch ([error code]) {
                case ALAssetsLibraryAccessUserDeniedError:
                case ALAssetsLibraryAccessGloballyDeniedError:
                    errorMessage = @"用户拒绝访问相册,请在<隐私>中开启";
                    break;
                    
                default:
                    errorMessage = @"Reason unknown.";
                    break;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"错误,无法访问!"
                                                                   message:errorMessage
                                                                  delegate:self
                                                         cancelButtonTitle:@"确定"
                                                         otherButtonTitles:nil, nil];
                [alertView show];
            });
        };
        
        
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc]  init];
        [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll
                                     usingBlock:listGroupBlock failureBlock:failureBlock];
    });
}

- (void)setupData {
    [[ZHFScribbleManager sharedZHFScribbleManager] thumbnails:^(NSArray * _Nonnull pictures) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.dataSource = [NSMutableArray arrayWithArray:pictures];
            [self.collectionView reloadData];
        });
    }];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImageView *imageV = [cell.contentView viewWithTag:100];
    imageV.image = self.dataSource[indexPath.row];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.block) {
        self.block(indexPath.row);
    }
    [self back:nil];
}


@end
