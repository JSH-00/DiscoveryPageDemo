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



@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray <Student *>* myData;
@property (nonatomic, weak) UITableView * myTableView;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MyData *my_Data = [MyData new];
    self.myData = [my_Data getStudentList]; // 获取
    [self.navigationController setNavigationBarHidden:YES animated:YES]; // 隐藏NavigateBar
    UITableView *view = [UITableView new];
    self.myTableView = view;
    view.dataSource = self;
    view.delegate = self;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight = 500;
    view.frame = CGRectMake(0 , 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    NSDictionary *dic = @{@"studentID": @"javk",
                          @"studentName": @"name",
                          @"studentAddress":@"address",
                          @"imageURL":@"url00000"
    };
    
    Student *sut = [[Student alloc] initWithDictionary:dic];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

// 这个方法返回对应的section有多少个元素，也就是多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.myData count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellID = @"cellID";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    [cell config:self.myData[indexPath.row]];

    //    cell.accessoryType = UITableViewCellAccessoryNone;//cell没有任何的样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell的右边有一个小箭头，距离右边有十几像素；
    //    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;//cell右边有一个蓝色的圆形button；
    //    cell.accessoryType = UITableViewCellAccessoryCheckmark;//cell右边的形状是对号；

    return cell;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0; // 设置cell 高度
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    Student *selectedStudent = [self.myData objectAtIndex:[[self.myTableView indexPathForSelectedRow] row]];
    
    // Pass it to DetailViewController

    DetailViewController *SVC = [[DetailViewController alloc]init];
    [SVC setSelectedStudent:selectedStudent];
    [self.navigationController pushViewController:SVC animated:YES];

}

@end
