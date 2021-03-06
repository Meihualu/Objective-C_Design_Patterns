//
//  DPSubTitleTableVC.m
//  Design_Patterns_Demoes
//
//  Created by 周飞 on 2019/3/30.
//  Copyright © 2019年 zhf. All rights reserved.
//

#import "DPSubTitleTableVC.h"
#import "DPPrototypeViewController.h"
#import "DPMacro.h"
#import "DPFactoryViewController.h"
#import "DPAbstractFactoryViewController.h"
#import "DPBuilderViewController.h"
#import "DPFlyweightViewController.h"
#import "DPChainOfRespViewController.h"
#import "DPCommandViewController.h"
#import "DPTemplateMethodViewController.h"
#import "DPStrategyViewController.h"
#import "DPVisitorViewController.h"
#import "DPDecoraterViewController.h"
#import "DPCompositeViewController.h"
#import "DPMementoViewController.h"
#import "DPObserverViewController.h"
#import "DPMediatorViewController.h"


static NSString *cellID =@"myCell";


@interface DPSubTitleTableVC ()
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, assign) DPSubTitleTableType type;
@end

@implementation DPSubTitleTableVC

- (instancetype)initWithDataSource:(NSArray *)dataSource type:(DPSubTitleTableType)type
{
    self = [super init];
    if (self) {
        self.dataSource = dataSource;
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self.tableView setRowHeight:50];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (self.type) {
        case DPSubTitleTableCreateType:
        {
            switch (indexPath.row) {
                case 0:
                {
                    DPPrototypeViewController *subTable = [DPPrototypeViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                case 1:
                {
                    DPFactoryViewController *factory = [DPFactoryViewController new];
                    [self.navigationController pushViewController:factory animated:YES];
                }
                    break;
                case 2:
                {
                    DPAbstractFactoryViewController *abstractFactory = [DPAbstractFactoryViewController new];
                    [self.navigationController pushViewController:abstractFactory animated:YES];
                }
                    break;
                case 3:
                {
                    DPBuilderViewController *builderFactory = [DPBuilderViewController new];
                    [self.navigationController pushViewController:builderFactory animated:YES];
                }
                    break;
                case 4:
                {
                    
                }
                    break;
                    
                    
                default:
                    break;
            }
            
        }
            break;
        case DPSubTitleTablePerformanceType:
        {
            switch (indexPath.row) {
                case 0:
                {
                    DPFlyweightViewController *subTable = [DPFlyweightViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case DPSubTitleTableActionExtendType:
        {
            switch (indexPath.row) {
                case 0:
                {
                    DPChainOfRespViewController *subTable = [DPChainOfRespViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                case 1:
                {
                    DPDecoraterViewController *subTable = [DPDecoraterViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                case 2:
                {
                    DPVisitorViewController *subTable = [DPVisitorViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case DPSubTitleTableActionArithmeticType:
        {
            switch (indexPath.row) {
                case 0:
                {
                    DPCommandViewController *subTable = [DPCommandViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                case 1:
                {
                    DPStrategyViewController *subTable = [DPStrategyViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                case 2:
                {
                    DPTemplateMethodViewController *subTable = [DPTemplateMethodViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case DPSubTitleTableAbstractType:
        {
            switch (indexPath.row) {
                case 0:
                {
                    DPCompositeViewController *subTable = [DPCompositeViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case DPSubTitleTableMementoType:
        {
            switch (indexPath.row) {
                case 0:
                {
                    DPMementoViewController *subTable = [DPMementoViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case DPSubTitleTableDecouplingType:
        {
            switch (indexPath.row) {
                case 0:
                {
                    DPObserverViewController *subTable = [DPObserverViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                case 1:
                {
                    DPMediatorViewController *subTable = [DPMediatorViewController new];
                    [self.navigationController pushViewController:subTable animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;

        default:
            break;
    }
    
    
    //DPFlyweightViewController
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
