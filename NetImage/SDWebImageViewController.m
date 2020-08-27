//
//  SDWebImageViewController.m
//  NetImage
//
//  Created by JSH on 2020/8/25.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "SDWebImageViewController.h"
#import <SDWebImage/SDWebImage.h>
#import <SDWebImageFLPlugin/SDWebImageFLPlugin.h>


@interface SDWebImageViewController ()

@end

@implementation SDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
//
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, 100, 300, 200)];
////    SDAnimatedImage *animatedImage = [SDAnimatedImage imageNamed:@"GIF_one.gif"];
////    imageView.image = animatedImage;
//    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://www.baidu.com/img/dong_e8b80aecc2ee2ab14545e57e1ee7642b.gif"]
//                       placeholderImage:[UIImage imageNamed:@"GIF_two.gif"]];
////    imageView.backgroundColor = [UIColor redColor];
//    [self.view bringSubviewToFront:imageView];

    
//    [self.view addSubview:imageView];
    
    
    
//
////    UIImageView * gifImageView = [[UIImageView alloc]initWithFrame:CGRectMake(35, 100, 300, 200)];
//    NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"GIF_one" ofType:@"gif"];
//    NSData *gif = [NSData dataWithContentsOfFile:gifPath];
//    FLAnimatedImage *image2 = [FLAnimatedImage animatedImageWithGIFData:gif];
//    FLAnimatedImageView *imageView = [FLAnimatedImageView new];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.animatedImage = image2;
//    imageView.frame = CGRectMake(0.0, 200.0, 100.0, 100.0);
//    imageView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:imageView];
    
    
    
//    FLAnimatedImageView *imgView = [FLAnimatedImageView new];
//    imgView.contentMode = UIViewContentModeScaleAspectFit;
//    imgView.frame = CGRectMake(0, 200, 100, 30);
//    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]]pathForResource:@"GIF_two" ofType:@"gif"];
//    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
//    imgView.backgroundColor = [UIColor clearColor];
//    imgView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:imageData];
//    [self.view addSubview:imgView];
    
    NSString  *filePath = [[NSBundle bundleWithPath:[[NSBundle mainBundle] bundlePath]]pathForResource:@"GIF_two" ofType:@"gif"];
    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:imageData];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.frame = CGRectMake(0.0, 200.0, 100.0, 100.0);
    [self.view addSubview:imageView];
}
@end
