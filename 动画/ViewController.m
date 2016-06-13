//
//  ViewController.m
//  动画
//
//  Created by nbs on 16/4/29.
//  Copyright © 2016年 nbs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIView *imView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.layer.contents = (id)[UIImage imageNamed:@"a"].CGImage;
    
    self.imView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.imView.center = CGPointMake(self.view.center.x, self.view.center.y);
    self.imView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.imView];
    self.imView.layer.contents = (id)[UIImage imageNamed:@"bb.jpg"].CGImage;
    [self handleTransition];
    
}


- (void)handleTransition {
    
    
//    __weak typeof(self) weakSelf = self;
//    
//    [UIView transitionWithView:self.imView duration:4 options:(UIViewAnimationOptionAllowUserInteraction) animations:^{
//        self.imView.transform = CGAffineTransformRotate(weakSelf.imView.transform, M_PI);
//        
//    } completion:^(BOOL finished) {
//        
//    }];
    CAKeyframeAnimation *kframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPoint point = self.imView.center;
    CGPoint point1 = CGPointMake(0, 10);
    CGPoint point2 = CGPointMake(0, 700);
    CGPoint point3 = CGPointMake(100, 0);
    CGPoint point4 = CGPointMake(500, 600);
    CGPoint point5 = CGPointMake(self.view.center.x, self.view.center.y);
    
     NSValue *value1 = [NSValue valueWithCGPoint:point];
     NSValue *value2 = [NSValue valueWithCGPoint:point1];
     NSValue *value3 = [NSValue valueWithCGPoint:point2];
     NSValue *value4 = [NSValue valueWithCGPoint:point3];
     NSValue *value5 = [NSValue valueWithCGPoint:point4];
     NSValue *value6 = [NSValue valueWithCGPoint:point5];
    kframe.values = @[value1,value2,value3,value4,value5,value6];
//    kframe.duration = 10;
//    kframe.repeatCount = 10;
    [self.imView.layer addAnimation:kframe forKey:nil];
    
    //    创建第二个关键帧动画,让热气球运动的时候.由 小-->大-->小
    CAKeyframeAnimation *keyframeScale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    keyframeScale.values = @[@1.0,@1.2,@1.4,@1.6,@1.8,@1.6,@1.4,@1.2,@1.0];
    //创建动画分组对象
    CAAnimationGroup *group = [CAAnimationGroup animation];
    //将两个动画效果添加到分组动画中
    group.animations = @[kframe,keyframeScale];
    group.duration = 8;
    group.repeatCount = HUGE;
    
    [self.imView.layer addAnimation:group forKey:nil];
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
