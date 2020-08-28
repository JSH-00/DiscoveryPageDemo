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
    [bookImageView sd_setImageWithURL:[NSURL URLWithString:_stu.thumbnail]
                            placeholderImage:[UIImage imageNamed:@"small_two.png"]];
//    bookImageView.image = _stu.studentImage;
    nameLabel.text = _stu.author;
    prcieLabel.text = [self transToTime:[NSString stringWithFormat:@"%@",_stu.create_time]];
    descLabel.text = [NSString stringWithFormat:@"width: %@",_stu.width];

}

- (void)setSelectedStudent:(Student *)student {
    _stu = student;
}

//字符串转时间戳 如：2017-4-10 17:15:10
- (NSString *)transToTime:(NSString *)timeStamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:ss"];
    NSTimeInterval time =[timeStamp doubleValue];
    NSDate*detaildate=[NSDate dateWithTimeIntervalSince1970:time/1000.0];
    return [formatter stringFromDate:detaildate];

}

@end
