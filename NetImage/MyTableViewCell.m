//
//  MyTableViewCell.m
//  NetImage
//
//  Created by JSH on 2020/8/24.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "MyTableViewCell.h"


@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化视图对象
        // 图片
        _bookImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
        // 添加到父视图
        // 自定义cell的时候, 所有视图都添加到cell的contentView中
        [self.contentView addSubview:_bookImageView];
        
        // 书名
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, 200, 20)];
        [self.contentView addSubview:_nameLabel];
        
        // 价格
        _prcieLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 200, 20)];
        [self.contentView addSubview:_prcieLabel];
        
        // 描述
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 55, 200, 20)];
        [self.contentView addSubview:_descLabel];
    }
    return self;
}

// 自定义Cell中显示数据的方法
- (void)config:(Student *)model
{
    NSLog(@"");
    [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnail]
                          placeholderImage:[UIImage imageNamed:@"small_one.png"]];
    
    
    self.nameLabel.text = model.author;
    self.prcieLabel.text = [self transToTime:[NSString stringWithFormat:@"%@",model.create_time]];
    self.descLabel.text = model.type;
    NSLog(@"");

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
