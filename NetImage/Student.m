//
//  Student.m
//  NetImage
//
//  Created by JSH on 2020/8/24.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{
    NSLog(@"%s",__func__);
    [super setValuesForKeysWithDictionary:keyedValues];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    self.time_formatter = formatter;
    [self.time_formatter setDateFormat:@"yyyy-MM-dd HH:ss"];
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.studentName = name;
    }
    return self;
}

- (NSString *)time_new
{
    _time_new = [self formattTimeStringWith:self.create_time];
    return _time_new;
}

//字符串转时间戳 如：2017-4-10 17:15:10
- (NSString *)formattTimeStringWith:(NSString *)timeStamp{
    NSTimeInterval time =[timeStamp doubleValue];
    NSDate*detaildate=[NSDate dateWithTimeIntervalSince1970:time/1000.0];
    NSLog(@"%@",self.time_formatter);
    return [self.time_formatter stringFromDate:detaildate];
}
@end
