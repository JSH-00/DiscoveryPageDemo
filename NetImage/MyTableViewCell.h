//
//  MyTableViewCell.h
//  NetImage
//
//  Created by JSH on 2020/8/24.
//  Copyright © 2020 JSH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import <SDWebImage/SDWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
//@property (nonatomic, weak) UILabel * titleLable;
//@property (nonatomic, weak) UILabel * addressLable;


// 左边的图片, 需要注意: 不要和父类的imageView属性冲突
@property (nonatomic, strong) UIImageView *bookImageView;
// 书名,      需要注意: 不要和父类的textLabel和DetailTextLable属性冲突
@property (nonatomic, strong) UILabel *nameLabel;
// 价格
@property (nonatomic, strong) UILabel *prcieLabel;
// 描述
@property (nonatomic, strong) UILabel *descLabel;

// 显示数据
- (void)config:(Student *)model;
@end

NS_ASSUME_NONNULL_END
