//
//  TableViewController.m
//  NetImage
//
//  Created by JSH on 2020/8/24.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "TableViewController.h"
#import "MyData.h"
#import "Student.h"
#import "MyTableViewCell.h"
#import "DetailViewController.h"
#import <AFNetworking/AFNetworking.h>




@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray * myArrayData;
@property (nonatomic, strong) NSMutableDictionary * myDictonaryData;
@property (nonatomic, weak) UIView * topView;
@property (nonatomic, weak) UILabel * topTextLabel;
@property (nonatomic, strong) UITableView * myTableView;
@property (nonatomic, weak) UIButton * editorBtn;

- (void)reloadStudentList;
@end

@implementation TableViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@">>>>>>>>viewWillAppear:%s",__func__);
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@">>>>>>>>viewDidAppear:%s",__func__);
}
-(void)viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated];
    NSLog(@">>>>>>>>viewWillDisappear:%s",__func__);
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@">>>>>>>>>viewDidDisappear:%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@">>>>>>>>viewDidLoad" );
    [self reloadStudentList];
    [self.navigationController setNavigationBarHidden:YES animated:YES]; // 隐藏NavigateBar\
    
    UIView *top_view = [[UIView alloc] init];
    self.topView = top_view;
    top_view.frame = CGRectMake(0, 0, 375, 64);
    top_view.backgroundColor = [UIColor colorWithRed:18/255.0 green:18/255.0 blue:18/255.0 alpha:1/1.0];
    [self.view addSubview:top_view];
    
    UILabel *top_text_label = [[UILabel alloc] init];
    self.topTextLabel = top_text_label;
    top_text_label.frame = CGRectMake(172, 31, 32, 22);
    top_text_label.text = @"发现";
    top_text_label.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];
    top_text_label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
    [self.view addSubview:top_text_label];
    
    UIButton *editor_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editorBtn = editor_btn;
    [self.view  addSubview:editor_btn];
    [editor_btn addTarget:self action:@selector(editorButton) forControlEvents:UIControlEventTouchUpInside];
    editor_btn.frame = CGRectMake(300, 31, 50 ,22);
    [editor_btn setTitle:@"编辑" forState:UIControlStateNormal];
    editor_btn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];

    UITableView *view = [UITableView new];
    self.myTableView = view;
    view.dataSource = self;
    view.delegate = self;
    view.frame = CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    // 让tableView进入编辑状态
    [self.myTableView setEditing:YES animated:NO];
}

// 这个方法返回对应的section有多少个元素，也就是多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.myArrayData count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellID = @"cellID";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    [cell config:self.myArrayData[indexPath.row]];
    //cell 选中时无效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.accessoryType = UITableViewCellAccessoryNone;//cell没有任何的样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell的右边有一个小箭头，距离右边有十几像素；
    //    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;//cell右边有一个蓝色的圆形button；
    //    cell.accessoryType = UITableViewCellAccessoryCheckmark;//cell右边的形状是对号；
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 207; // 设置cell 高度
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    Student *selectedStudent = [self.myArrayData objectAtIndex:[[self.myTableView indexPathForSelectedRow] row]];
    DetailViewController *SVC = [[DetailViewController alloc]init];
    [SVC setSelectedStudent:selectedStudent];
    [self.navigationController pushViewController:SVC animated:YES];
    // 删除cell选中后的颜色
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (void)reloadStudentList
{
    self.myArrayData = [NSMutableArray new];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"]; //指定接收信号为image/png
    [manager GET:@"https://zerozerorobotics.com/api/v1/showcase/no-scene.json?skip=0&take=5" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功");
        NSMutableArray * candyDictionaryArray = responseObject; //返回为Array类型
        
        for (int i = 0 ; i < candyDictionaryArray.count ; i++)
        {
            Student *sut = [[Student alloc] initWithDictionary:[candyDictionaryArray objectAtIndex:i]];
            [self.myArrayData addObject:sut];
        }
        
        [self.myTableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        NSLog(@"%@",error);
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - 右滑删除操作
// 判断某行是否可删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return YES;
}

// 返回删除模式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除
    return UITableViewCellEditingStyleDelete;
}

// 删除按钮改为中文
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.myArrayData removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        [self.myArrayData addObject:@100];
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.myArrayData.count - 1 inSection:0];
        [tableView insertRowsAtIndexPaths:@[newIndexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)editorButton
{
    if ([self.myTableView isEditing])
    {
        [self.editorBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [self.myTableView setEditing:NO animated:NO];
    }
    else
    {
        [self.editorBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.myTableView setEditing:YES animated:NO];
        
    }
    
    
}
//// 提交删除操作
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//        //只要实现这个方法，就实现了默认滑动删除！！！！！
//        if (editingStyle == UITableViewCellEditingStyleDelete)
//        {
//            // 删除数据
//            [self _deleteSelectIndexPath:indexPath];
//            [self.myTableView deleteSections:indexPath withRowAnimation:(UITableViewRowAnimationLeft)];
//        }
//}
@end
