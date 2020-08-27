//
//  DetailViewController.m
//  NetImage
//
//  Created by JSH on 2020/8/24.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "DetailViewController.h"
#import <SDWebImage/SDWebImage.h>


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES]; // 隐藏NavigateBar
    // Do any additional setup after loading the view.
    // 图片
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * bookImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 110, 100, 100)];
    // 添加到父视图
    // 自定义cell的时候, 所有视图都添加到cell的contentView中
    [self.view addSubview:bookImageView];
    
    // 书名
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 105, 200, 20)];
    [self.view addSubview:nameLabel];
    
    // 价格
    UILabel * prcieLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 130, 200, 20)];
    [self.view addSubview:prcieLabel];
    
    // 描述
    UILabel * descLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 155, 200, 100)];
    [self.view addSubview:descLabel];
//    descLabel.textAlignment = NSTextAlignmentCenter;
    // 多行显示
    descLabel.numberOfLines=0;
    descLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [bookImageView sd_setImageWithURL:[NSURL URLWithString:_stu.imageURL]
                            placeholderImage:[UIImage imageNamed:@"small_one.png"]];
//    bookImageView.image = _stu.studentImage;
    nameLabel.text = _stu.studentName;
    prcieLabel.text = _stu.studentID;
    descLabel.text = _stu.studentAddress;

}

- (void)setSelectedStudent:(Student *)student {
    _stu = student;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
