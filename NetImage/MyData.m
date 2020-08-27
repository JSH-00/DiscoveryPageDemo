//
//  MyData.m
//  NetImage
//
//  Created by JSH on 2020/8/24.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "MyData.h"
#import "Student.h"
#import <AFNetworking/AFNetworking.h>

@implementation MyData
- (NSMutableArray *)getStudentList
{
    NSMutableArray *studentArray = [[NSMutableArray alloc]init];
 
////    NSMutableArray *webImageArray = [[NSMutableArray alloc]init];
//    UIImageView *imageView1 = [UIImageView new];
//    UIImageView *imageView2 = [UIImageView new];
//    UIImageView *imageView3 = [UIImageView new];
//    UIImageView *imageView4 = [UIImageView new];
//    UIImageView *imageView5 = [UIImageView new];
//
//
////    [webImageArray addObject:imageView.image];
//
//    Student *std1 = [[Student alloc] init];
//    
//    std1.studentID = @"S01";
//    std1.studentName = @"Anna K. Behrensmeyer";
//    std1.studentAddress = @"711-2880 Nulla St Mankato Mississippi 96522";
//    std1.imageURL = @"https://c-ssl.duitang.com/uploads/item/201904/27/20190427225628_tqmnv.jpg";
//
//    Student *std2 = [[Student alloc] init];
//    std2.studentID = @"S02";
//    std2.studentName = @"Blaise Pascal";
//    std2.studentAddress = @"7292 Dictum Av. San Antonio MI 47096";
//    std2.imageURL = @"https://c-ssl.duitang.com/uploads/item/201810/02/20181002231025_hhnyu.thumb.700_0.jpeg";
//
//
//    Student *std3 = [[Student alloc] init];
//    std3.studentID = @"S03";
//    std3.studentName = @"Caroline Herschel";
//    std3.studentAddress = @"191-103 Integer Rd. Corona New Mexico 08219";
//    std3.imageURL = @"https://c-ssl.duitang.com/uploads/item/201506/27/20150627095500_ZMwjv.gif";
//
//
//
//    Student *std4 = [[Student alloc] init];
//    std4.studentID = @"S04";
//    std4.studentName = @"Cecilia Payne-Gaposchkin";
//    std4.studentAddress = @"P.O. Box 887 2508 Dolor. Av. Muskegon KY 12482";
//    std4.imageURL = @"https://c-ssl.duitang.com/uploads/item/201607/12/20160712104347_HnYKx.gif";
//
//
//
//    Student *std5 = [[Student alloc] init];
//    std5.studentID = @"S05";
//    std5.studentName = @"Dorothy Hodgkin";
//    std5.studentAddress = @"935-9940 Tortor. Street Santa Rosa MN 98804";
//    std5.imageURL = @"https://c-ssl.duitang.com/uploads/item/201712/19/20171219162405_wkmSc.gif";
//
//    [studentArray addObject:std1];
//    [studentArray addObject:std2];
//    [studentArray addObject:std3];
//    [studentArray addObject:std4];
//    [studentArray addObject:std5];
//
    

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"]; //指定接收信号为image/png
    
    [manager GET:@"https://zerozerorobotics.com/api/v1/showcase/no-scene.json?skip=0&take=10" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功");
        self.candyDictionaryArray = responseObject; //返回为Array类型

        for (int i = 0 ; i < self.candyDictionaryArray.count ; i++)
        {
            Student *sut = [[Student alloc] initWithDictionary:[self.candyDictionaryArray objectAtIndex:i]];
            [studentArray addObject:sut];
        }
//        Student *sut = [[Student alloc] initWithDictionary:[self.candyDictionaryArray objectAtIndex:0]];

        NSLog(@"%@",[self.candyDictionaryArray objectAtIndex:0]);
        NSLog(@"studentArray:%@",studentArray);

        NSLog(@"");

    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        NSLog(@"%@",error);
    }];
    
  NSLog(@"studentArray:%@",studentArray);
    
    
    return studentArray;
    
}

@end
