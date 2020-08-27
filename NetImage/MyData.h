//
//  MyData.h
//  NetImage
//
//  Created by JSH on 2020/8/24.
//  Copyright © 2020 JSH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDWebImage/SDWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyData : NSObject
- (NSMutableArray *)getStudentList;
@property (nonatomic, strong) NSMutableArray *candyDictionaryArray;
@end

NS_ASSUME_NONNULL_END
