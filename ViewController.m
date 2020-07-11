//
//  ViewController.m
//  helloTest
//
//  Created by JSH on 2020/7/3.
//  Copyright © 2020 JSH. All rights reserved.
//
#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
@property(nonatomic,weak) UIButton *FirstButton;
@property(nonatomic,weak) UIButton *SecondButton;
@property(nonatomic,weak) UIButton *ThirdButton;
@property(nonatomic,weak) UIButton *FourthButton;
@property(nonatomic,assign) CGFloat ScreenWidth;
@property(nonatomic,assign) CGFloat ScreenHeight;
@property(nonatomic,assign) CGFloat ButtonWidth;
@property(nonatomic,assign) CGFloat ButtonHeight;
@end

@implementation ViewController

- (void)viewDidLoad {
    
//    --frame标签位置----------------------------------------------------------------------------------

    self.ScreenWidth = self.view.frame.size.width;
    self.ScreenHeight = self.view.frame.size.height;
    self.ButtonWidth = 100;
    self.ButtonHeight = 60;
    CGFloat ButtonNum = 4.0;
    CGFloat ButtonMargin = 10;
    CGFloat ImageMargin = 10;

    UIImageView *TopImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 30, 30)];
    [TopImage setImage:[UIImage imageNamed:@"top_image.png"]];
    [self.view addSubview:TopImage];
    
    UIImageView *MiddleImage = [[UIImageView alloc] initWithFrame:CGRectMake(ImageMargin, 100, self.ScreenWidth - ImageMargin * 2, self.ScreenWidth * 260 / 700)];
    MiddleImage.image = [UIImage imageNamed:@"middle_image.png"];
    MiddleImage.layer.cornerRadius = 5;
    MiddleImage.layer.masksToBounds = YES;
    
//    [MiddleImage setImage:[UIImage imageNamed:@"middle_image.png"]];
    
    [self.view addSubview:MiddleImage];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.FirstButton = btn1;
    btn1.frame = CGRectMake(ButtonMargin, self.ScreenHeight - self.ButtonHeight - 10, (self.ScreenWidth / ButtonNum  - 2 * ButtonMargin), self.ButtonHeight);
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"First" forState:(UIControlStateNormal)];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.SecondButton = btn2;
    btn2.frame = CGRectMake(ButtonMargin * 3 + (self.ScreenWidth / ButtonNum  - 2 * ButtonMargin), self.ScreenHeight - self.ButtonHeight - 10, (self.ScreenWidth / ButtonNum  - 2 * ButtonMargin), self.ButtonHeight);
    btn2.backgroundColor = [UIColor yellowColor];
    [btn2 setTitle:@"Second" forState:(UIControlStateNormal)];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ThirdButton = btn3;
    btn3.frame = CGRectMake(ButtonMargin * 5 + (self.ScreenWidth / ButtonNum  - 2 * ButtonMargin) * 2, self.ScreenHeight - self.ButtonHeight - 10, (self.ScreenWidth / ButtonNum  - 2 * ButtonMargin), self.ButtonHeight);
    btn3.backgroundColor = [UIColor blueColor];
    [btn3 setTitle:@"Third" forState:(UIControlStateNormal)];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.FourthButton = btn4;
    btn4.frame = CGRectMake(ButtonMargin * 7 + (self.ScreenWidth / ButtonNum  - 2 * ButtonMargin) * 3, self.ScreenHeight - self.ButtonHeight - 10, (self.ScreenWidth / ButtonNum) - 2 * ButtonMargin, self.ButtonHeight);
    btn4.backgroundColor = [UIColor greenColor];
    [btn4 setTitle:@"Fourth" forState:(UIControlStateNormal)];
    [self.view addSubview:btn4];
//    ------------------------------------------------------------------------------------
//    UIButton *btn2 = [UIButton buttonWithType: UIButtonTypeCustom];
//    self.myToGreenBotton = btn2;
//    btn2.frame = CGRectMake(30, 150, 100, 40);
//    [btn2 setTitle:@"变绿" forState:(UIControlStateNormal)];
//    btn2.backgroundColor = [UIColor redColor];
//    [btn2 addTarget:self action:@selector(clickChangeToGreen) forControlEvents:UIControlEventTouchUpInside];
//    //设置button的size，sizeToFit的作用是自动计算出btn的最优大小并进行设置
//    [self.view addSubview:btn2];
}
@end
//#import "ViewController.h"
//#import "AppDelegate.h"
//#import "Dog.h"
//typedef NS_ENUM(NSInteger,ViewColor) {
//    ViewColorRed = 2,
//    ViewColorYellow = 3,
//    ViewColorBlue = 4
//};
//
//@interface ViewController ()
//{
//    ViewColor _bgcolor;
//}
//@property(nonatomic,weak) UIButton *myToRedBotton;
//@property(nonatomic,weak) UIButton *myToGreenBotton;
//@property(nonatomic,weak) UILabel *myLable;
//@property(nonatomic,strong) UIView *colorView;
//@property(nonatomic,weak) UIButton *changeColorButton;
//@property(nonatomic,weak) UIButton *changePositionButton;
//@property(nonatomic,weak) UISlider *changePositionSlider;
//@property(nonatomic, assign) ViewColor bgcolor;
//@property(nonatomic, assign) CGFloat screenWidth;
//@property(nonatomic, strong) AppDelegate *appp;
//@property(nonatomic,assign) int a1;
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    void (^ simpleBlock) (void);
//    simpleBlock = ^{
//        NSLog(@"this is a block");
//    };
//
//    double (^multiplyTwoValues)(double, double);
//    multiplyTwoValues = ^ double(double firstValue,double secondValue)
//    {
////        NSLog(@"%d",firstValue * secondValue);
//        return firstValue * secondValue;
//    };
//    simpleBlock();
//    double multiplyTwoValue = multiplyTwoValues(2,3);
//    NSLog(@"%f",multiplyTwoValue);
//
//
//
//    self.a1 = 42;
//
//
////
////    void (^testBlock)(void) = ^{
////
////        NSLog(@"Integer is: %i", self.a1);
////        self.a1 = 100;
////       };
////        self.a1 = 84;
////        testBlock();
//       __block int anInteger = 42;
//
//       void (^testBlock)(void) = ^{
//           NSLog(@"Integer is: %i", anInteger);
//           anInteger = 100;
//       };
//
//       testBlock();
//       NSLog(@"Value of original variable is now: %i", anInteger);
//
//
//
//
////    NSLog(@"%s start",__func__);
////
//////    __weak typeof(AppDelegate)*obj = [AppDelegate new];
////
////
////    AppDelegate *a1 = [AppDelegate new];
////
////    AppDelegate *a2 = [AppDelegate new];
////
////    a1.app = a2;
////    a2.app = a1;
////
////    NSLog(@"*****************=>  %ld", CFGetRetainCount((__bridge CFTypeRef)a1));
////    NSLog(@"*****************=>  %ld", CFGetRetainCount((__bridge CFTypeRef)a2));
////
////    a1.app = nil;
////    NSLog(@"APP %@",a1);
////
//////    a1.mymymymymydog =  [Dog new];
//////
//////    Dog*  dog1 = [Dog new];
//////
//////    a1.mymymymymydog = dog1;
//////
//////
//////    self.appp = a1;
////
////    [super viewDidLoad];
////    self.screenWidth = self.view.frame.size.width; //屏幕水平中心点
//////    self.view.backgroundColor = [UIColor redColor];
////
////
//////    UILabel *lable1=[UILabel new];
////    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 100, 40)];
////    self.myLable = lable1;
////    lable1.text = @"this is a label";
//////    lable1.frame = CGRectMake(30, 30, 100, 40);
////    lable1.backgroundColor = [UIColor whiteColor];
////    lable1.textColor = [UIColor brownColor];
////    [self.view addSubview:lable1];
////
////    UIButton* btn1=[UIButton buttonWithType:UIButtonTypeCustom];
////    self.myToRedBotton = btn1;
////    //    UIButton* btn = [UIButton new];
////    btn1.frame=CGRectMake(30, 80, 100, 40);
////    btn1.backgroundColor=[UIColor redColor];
////    [btn1 setTitle:@"变红" forState:(UIControlStateNormal)];
//////    [btn1 setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:( UIControlStateNormal)];
////    [btn1 addTarget:self action:@selector(clickChangeToRed) forControlEvents:UIControlEventTouchUpInside];
////    [self.view addSubview:btn1];
////
////    UIButton *btn2 = [UIButton buttonWithType: UIButtonTypeCustom];
////    self.myToGreenBotton = btn2;
////    btn2.frame = CGRectMake(30, 150, 100, 40);
////    [btn2 setTitle:@"变绿" forState:(UIControlStateNormal)];
////    btn2.backgroundColor = [UIColor redColor];
////    [btn2 addTarget:self action:@selector(clickChangeToGreen) forControlEvents:UIControlEventTouchUpInside];
////    //设置button的size，sizeToFit的作用是自动计算出btn的最优大小并进行设置
////    [self.view addSubview:btn2];
////    // Do any additional setup after loading the view.
////
//////    UIView *centerView = [UIView new];
//////    self.colorView = centerView;
//////    self.screenWidth = self.view.frame.size.width; //屏幕水平中心点
//////    centerView.backgroundColor = [UIColor yellowColor];
//////    centerView.frame = CGRectMake((self.screenWidth / 2) - (100 / 2), 300, 100, 100);
//////    [self.view addSubview:centerView];
////
////
////    UIButton *btn3 = [UIButton buttonWithType: UIButtonTypeCustom];
////    self.changeColorButton = btn3;
////    btn3.frame = CGRectMake((self.screenWidth / 2) - (100 / 2) - 60, 500, 100, 40);
////    [btn3 setTitle:@"改变颜色" forState:(UIControlStateNormal)];
////    [btn3 setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
////    [btn3 addTarget:self action:@selector(clickChangeColorToRGB) forControlEvents:UIControlEventTouchUpInside];
////    [self.view addSubview:btn3];
////
////
////    UIButton *btn4 = [UIButton buttonWithType: UIButtonTypeCustom];
////    self.changePositionButton = btn4;
////    btn4.frame = CGRectMake((self.screenWidth / 2) - (100 / 2) + 60, 500, 100, 40);
////    [btn4 setTitle:@"改变位置" forState:(UIControlStateNormal)];
////    [btn4 setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
////    [btn4 addTarget:self action:@selector(clickToChangePosition) forControlEvents:UIControlEventTouchUpInside];
////    //设置button的size，sizeToFit的作用是自动计算出btn的最优大小并进行设置
////    [self.view addSubview:btn4];
////    // Do any additional setup after loading the view.
////
////    UISlider *mySlider = [[UISlider alloc]initWithFrame:CGRectMake((self.screenWidth / 2) - (200 / 2), 450, 200, 40)];
////    self.changePositionSlider = mySlider;
////    mySlider.minimumValue = 0.0;
////    mySlider.maximumValue = self.screenWidth - 100;
//////    mySlider.continuous = NO;
////    [mySlider addTarget:self action:@selector(sliderChanged)forControlEvents:UIControlEventValueChanged];
////    [self.view addSubview:mySlider];
////    NSLog(@"%s end",__func__);
//
//    }
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    //    self.appp = nil;
//    NSLog(@"点击屏幕");
//    NSLog(@"---------");
//
////    [self beginTaskWithCallbackBlockWithNumber:2];
////return;
//    __block NSString *result = @"";
//
//    [self beginTaskWithCallbackBlock:^(bool success, NSString *info) {
//        //shui wan le gaosuwo shuide zenmyang
//        NSLog(@"callback %d, %@",success,info);
//        if (success) {
//            //tushang
//            NSLog(@"shangban");
//            result = @"shangban";
//        } else {
//            NSLog(@"qingjia");
//            result = @"qingjia";
//        }
//    }];
//
//
//    NSLog(@"resule:%@",result);
//
//}
//
//- (IBAction)fetchRemoteInformation:(id)sender {
//
//}
//
//- (void)beginTaskWithCallbackBlockWithNumber:(int)number {
//    NSLog(@"reveive number :%d",number);
//}
//
//- (void)beginTaskWithCallbackBlock:(void (^)(bool success, NSString *info))afterSleep {
//
//    NSLog(@"kaishi sleep");
//    sleep(3);
//    NSLog(@"after sleep");
//
//    if (afterSleep) {
//        afterSleep(NO, @"nice");
////        afterSleep();
//    }
//}
////
////- (UIView *)colorView
////{
////
////    if (!_colorView)
////    {
////        NSLog(@"Lazy load color view!");
////        UIView *centerView = [UIView new];
////        _colorView = centerView;
////        centerView.backgroundColor = [UIColor yellowColor];
////        centerView.frame = CGRectMake((self.screenWidth / 2) - (100 / 2), 300, 100, 100);
////        NSLog(@"===%@",_colorView);
////
//////        [self.view addSubview:centerView];
////    }
////
////    return _colorView;
////}
////
////
////- (void)setBgcolor:(ViewColor)bgcolor {
////    if (bgcolor == ViewColorYellow)
////      {
////          self.colorView.backgroundColor = [UIColor yellowColor];
////      }
////      else if (bgcolor == ViewColorBlue)
////      {
////         self.colorView.backgroundColor = [UIColor blueColor];
////      }
////      else if (bgcolor == ViewColorRed)
////      {
////        self.colorView.backgroundColor = [UIColor redColor];
////      }
////    _bgcolor = bgcolor;
////
////}
////
////- (ViewColor)bgcolor
////{
////    if(CGColorEqualToColor(self.colorView.layer.backgroundColor, [UIColor redColor].CGColor))
////        _bgcolor = ViewColorRed;
////    else if (CGColorEqualToColor(self.colorView.layer.backgroundColor, [UIColor yellowColor].CGColor))
////        _bgcolor = ViewColorYellow;
////    else if (CGColorEqualToColor(self.colorView.layer.backgroundColor, [UIColor blueColor].CGColor))
////        _bgcolor = ViewColorBlue;
////    return _bgcolor;
////}
////
////- (void)clickChangeToRed{
////    NSLog(@"点击了btn1,变红色");
////    self.view.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.8];
////    NSLog(@"color %@",self.view.backgroundColor);
////    self.myToRedBotton.backgroundColor=[UIColor greenColor];
////    self.myToGreenBotton.backgroundColor=[UIColor greenColor];
////
////    self.myLable.text = @"红色";
////}
////
////- (void)clickChangeToGreen{
////    NSLog(@"点击了btn2,变绿色");
////    self.view.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:0.8];
////    NSLog(@"color %@",self.view.backgroundColor);
////    self.myToRedBotton.backgroundColor=[UIColor redColor];
////    self.myToGreenBotton.backgroundColor=[UIColor redColor];
////    self.myLable.text = @"绿色";
////}
////
////- (void)clickChangeColorToRGB{
////
////    if (self.bgcolor == ViewColorYellow)
////    {
////        self.bgcolor = ViewColorBlue;
////        NSLog(@"点击了btn3,变蓝色");
////    }
////    else if (self.bgcolor == ViewColorBlue)
////    {
////        self.bgcolor = ViewColorRed;
////        NSLog(@"点击了btn3,变红色");
////    }
////    else if (self.bgcolor == ViewColorRed)
////    {
////      self.bgcolor = ViewColorYellow;
////        NSLog(@"点击了btn3,变黄色");
////    }
////
////}
////
////-  (void)clickToChangePosition
////{
////
//////    [self.view addSubview:self.colorView]; //???什么时候用到懒加载
////    NSLog(@"----%@",self.colorView);
////    int screenWidth = self.view.frame.size.width;
////    CGRect viewPosition = self.colorView.frame;
////    NSLog(@"点击了btn4,变位置%f",viewPosition.origin.x);
////    if(viewPosition.origin.x + 130 <= screenWidth)
////    {
////        viewPosition.origin.x += 30;
////        NSLog(@"点击了btn4,变位置%f",viewPosition.origin.x);
////    }
////    else
////    {
////       viewPosition.origin.x = 0;
////        NSLog(@"点击了btn4,变位置到最左侧");
////    }
////    self.colorView.frame = viewPosition;
////}
////
////- (void)sliderChanged
////{
////    NSLog(@"SliderValue %f",self.changePositionSlider.value);
////    CGRect viewPosition = self.colorView.frame;
////    viewPosition.origin.x = self.changePositionSlider.value;
////    self.colorView.frame = viewPosition;
////}
//
//@end
