//
//  SHNewViewController.m
//  NetImage
//
//  Created by JSH on 2020/8/16.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "SHNewViewController.h"
#import "PageViewController.h"
@interface SHNewViewController ()

@end

@implementation SHNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view  setBackgroundColor:[UIColor orangeColor]];
    self.navigationController.navigationBarHidden = false;
    
    // Do any additional setup after loading the view.
    
    //button
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
      [button setBackgroundColor:[UIColor redColor]];
      [self.view addSubview:button];
      [button addTarget:self action:@selector(nextVc) forControlEvents:UIControlEventTouchUpInside];
      [button setFrame:CGRectMake(60, 60, 100, 100)];
}
- (void)nextVc{
    PageViewController *newVc = [PageViewController new];
    [self.navigationController pushViewController:newVc animated:true];
    
   // [self presentViewController:newVc animated:YES completion:nil];
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
