/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  YHMessageTVC.m
 * @ProjectName(工程名):   ComponentDemo
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/12.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */

#import "YHMessageTVC.h"

#import "YHMessgaTBVCell.h"
#import "YHMsgMode.h"

@interface YHMessageTVC ()

@property (nonatomic,strong) NSMutableArray *dataMode;

@end

@implementation YHMessageTVC

-(NSMutableArray *)dataMode
{
    if (nil == _dataMode) {
        _dataMode = [NSMutableArray array];
    }
    return _dataMode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"消息";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    self.tableView.scrollEnabled = NO;
    
//    self.tableView.editing = YES;

    // 在编辑模式下可以对多行进行操作
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    
    [self.tableView setEditing:YES animated:YES];

    
     // 加载数据
    [self loadDataMode];
    
}
-(void)loadDataMode{
    
//    NSArray *iconArray = @[@"messages_icon_xitong",@"messages_icon_juan",@"messages_icon_dingdan",@"messages_icon_huodong",
//                           @"messages_icon_jifen"];
//    NSArray *titleArray = @[@"系统消息",@"优惠卷",@"订单",@"积分",@"活动"];
//    NSArray *detailArray = @[@"这是一条系统消息",@"您获得一张价值30元的无门槛优惠卷",@"你的订单在20分钟后到达",@"恭喜您！ 通过大转盘游戏h获得200积分",@"暂无活动消息"];
    
    NSMutableArray *iconArray =[NSMutableArray array];
     NSMutableArray *titleArray =[NSMutableArray array];
     NSMutableArray *detailArray =[NSMutableArray array];
    for (int i = 0; i<200; i++) {
        [iconArray addObject:@"messages_icon_xitong"];
        [titleArray addObject:@"系统消息"];
        [detailArray addObject:[NSString stringWithFormat:@"这是一条系统消息 - %d",i]];
    }
    
    for (int i = 0; i< iconArray.count; i++) {
        YHMsgMode *mode = [[YHMsgMode alloc] init];
        mode.icon = iconArray[i];
        mode.title = titleArray[i];
        mode.detail = detailArray[i];
        
        [self.dataMode addObject:mode];
    }    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//
//    return 5;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataMode.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ceii"  forIndexPath:indexPath.row]
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ceii"];
//
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ceii"];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//
//    cell.textLabel.text = [NSString stringWithFormat:@"index = %ld",(long)indexPath.row];
    
    YHMessgaTBVCell *cell = [YHMessgaTBVCell cellWithTableView:tableView];
    cell.mode  = self.dataMode[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{


    return 100;
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 150;
//}


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



//-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
//    return UITableViewCellEditingStyleInsert;
}
- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.dataArray removeObjectAtIndex: indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:self.dataMode
//                              withRowAnimation:UITableViewRowAnimationFade];
        [self.dataMode removeObject:self.dataMode[indexPath.row]];
        [self.tableView reloadData];
        
    }
}
@end
