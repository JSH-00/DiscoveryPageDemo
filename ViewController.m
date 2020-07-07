//
//  ViewController.m
//  helloTest
//
//  Created by JSH on 2020/7/3.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger,ViewColor) {
    ViewColorRed = 2,
    ViewColorYellow = 3,
    ViewColorBlue = 4
};

@interface ViewController ()
{
    ViewColor _bgcolor;
}
@property(nonatomic,weak) UIButton *myToRedBotton;
@property(nonatomic,weak) UIButton *myToGreenBotton;
@property(nonatomic,weak) UILabel *myLable;
@property(nonatomic,weak) UIView *colorView;
@property(nonatomic,weak) UIButton *changeColorButton;
@property(nonatomic,weak) UIButton *changePositionButton;
@property(nonatomic,weak) UISlider *changePositionSlider;
@property(nonatomic, assign) ViewColor bgcolor;
@property(nonatomic, assign) CGFloat screenWidth;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenWidth = self.view.frame.size.width; //屏幕水平中心点
//    self.view.backgroundColor = [UIColor redColor];
    

//    UILabel *lable1=[UILabel new];
    UILabel *lable1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 100, 40)];
    self.myLable = lable1;
    lable1.text = @"this is a label";
//    lable1.frame = CGRectMake(30, 30, 100, 40);
    lable1.backgroundColor = [UIColor whiteColor];
    lable1.textColor = [UIColor brownColor];
    [self.view addSubview:lable1];
    
    UIButton* btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    self.myToRedBotton = btn1;
    //    UIButton* btn = [UIButton new];
    btn1.frame=CGRectMake(30, 80, 100, 40);
    btn1.backgroundColor=[UIColor redColor];
    [btn1 setTitle:@"变红" forState:(UIControlStateNormal)];
//    [btn1 setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:( UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(clickChangeToRed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType: UIButtonTypeCustom];
    self.myToGreenBotton = btn2;
    btn2.frame = CGRectMake(30, 150, 100, 40);
    [btn2 setTitle:@"变绿" forState:(UIControlStateNormal)];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(clickChangeToGreen) forControlEvents:UIControlEventTouchUpInside];
    //设置button的size，sizeToFit的作用是自动计算出btn的最优大小并进行设置
    [self.view addSubview:btn2];
    // Do any additional setup after loading the view.

//    UIView *centerView = [UIView new];
//    self.colorView = centerView;
//    self.screenWidth = self.view.frame.size.width; //屏幕水平中心点
//    centerView.backgroundColor = [UIColor yellowColor];
//    centerView.frame = CGRectMake((self.screenWidth / 2) - (100 / 2), 300, 100, 100);
//    [self.view addSubview:centerView];
    
    
    UIButton *btn3 = [UIButton buttonWithType: UIButtonTypeCustom];
    self.changeColorButton = btn3;
    btn3.frame = CGRectMake((self.screenWidth / 2) - (100 / 2) - 60, 500, 100, 40);
    [btn3 setTitle:@"改变颜色" forState:(UIControlStateNormal)];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(clickChangeColorToRGB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    
    UIButton *btn4 = [UIButton buttonWithType: UIButtonTypeCustom];
    self.changePositionButton = btn4;
    btn4.frame = CGRectMake((self.screenWidth / 2) - (100 / 2) + 60, 500, 100, 40);
    [btn4 setTitle:@"改变位置" forState:(UIControlStateNormal)];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(clickToChangePosition) forControlEvents:UIControlEventTouchUpInside];
    //设置button的size，sizeToFit的作用是自动计算出btn的最优大小并进行设置
    [self.view addSubview:btn4];
    // Do any additional setup after loading the view.
    
    UISlider *mySlider = [[UISlider alloc]initWithFrame:CGRectMake((self.screenWidth / 2) - (200 / 2), 450, 200, 40)];
    self.changePositionSlider = mySlider;
    mySlider.minimumValue = 0.0;
    mySlider.maximumValue = self.screenWidth - 100;
//    mySlider.continuous = NO;
    [mySlider addTarget:self action:@selector(sliderChanged)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mySlider];
    }

- (UIView *)colorView
{
    if (!_colorView)
    {
        NSLog(@"Lazy load color view!");
        UIView *centerView = [UIView new];
        self.colorView = centerView;
        centerView.backgroundColor = [UIColor yellowColor];
        centerView.frame = CGRectMake((self.screenWidth / 2) - (100 / 2), 300, 100, 100);
        [self.view addSubview:centerView];
    }
    return _colorView;
}


- (void)setBgcolor:(ViewColor)bgcolor {
    if (bgcolor == ViewColorYellow)
      {
          self.colorView.backgroundColor = [UIColor yellowColor];
      }
      else if (bgcolor == ViewColorBlue)
      {
         self.colorView.backgroundColor = [UIColor blueColor];
      }
      else if (bgcolor == ViewColorRed)
      {
        self.colorView.backgroundColor = [UIColor redColor];
      }
    _bgcolor = bgcolor;
    
}

- (ViewColor)bgcolor
{
    if(CGColorEqualToColor(self.colorView.layer.backgroundColor, [UIColor redColor].CGColor))
        _bgcolor = ViewColorRed;
    else if (CGColorEqualToColor(self.colorView.layer.backgroundColor, [UIColor yellowColor].CGColor))
        _bgcolor = ViewColorYellow;
    else if (CGColorEqualToColor(self.colorView.layer.backgroundColor, [UIColor blueColor].CGColor))
        _bgcolor = ViewColorBlue;
    return _bgcolor;
}

- (void)clickChangeToRed{
    NSLog(@"点击了btn1,变红色");
    self.view.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.8];
    NSLog(@"color %@",self.view.backgroundColor);
    self.myToRedBotton.backgroundColor=[UIColor greenColor];
    self.myToGreenBotton.backgroundColor=[UIColor greenColor];

    self.myLable.text = @"红色";
}

- (void)clickChangeToGreen{
    NSLog(@"点击了btn2,变绿色");
    self.view.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:0.8];
    NSLog(@"color %@",self.view.backgroundColor);
    self.myToRedBotton.backgroundColor=[UIColor redColor];
    self.myToGreenBotton.backgroundColor=[UIColor redColor];
    self.myLable.text = @"绿色";
}

- (void)clickChangeColorToRGB{
    
    if (self.bgcolor == ViewColorYellow)
    {
        self.bgcolor = ViewColorBlue;
        NSLog(@"点击了btn3,变蓝色");
    }
    else if (self.bgcolor == ViewColorBlue)
    {
        self.bgcolor = ViewColorRed;
        NSLog(@"点击了btn3,变红色");
    }
    else if (self.bgcolor == ViewColorRed)
    {
      self.bgcolor = ViewColorYellow;
        NSLog(@"点击了btn3,变黄色");
    }
    
}

-  (void)clickToChangePosition
{
    int screenWidth = self.view.frame.size.width;
    CGRect viewPosition = self.colorView.frame;
    NSLog(@"点击了btn4,变位置%f",viewPosition.origin.x);
    if(viewPosition.origin.x + 130 <= screenWidth)
    {
        viewPosition.origin.x += 30;
        NSLog(@"点击了btn4,变位置%f",viewPosition.origin.x);
    }
    else
    {
       viewPosition.origin.x = 0;
        NSLog(@"点击了btn4,变位置到最左侧");
    }
    self.colorView.frame = viewPosition;
}

- (void)sliderChanged
{
    NSLog(@"SliderValue %f",self.changePositionSlider.value);
    CGRect viewPosition = self.colorView.frame;
    viewPosition.origin.x = self.changePositionSlider.value;
    self.colorView.frame = viewPosition;
}

@end
