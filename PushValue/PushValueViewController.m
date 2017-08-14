//
//  PushValueViewController.m
//  PushValue
//
//  Created by 张江威 on 2017/8/12.
//  Copyright © 2017年 YoungMonk. All rights reserved.
//

#import "PushValueViewController.h"
#import "BackViewController.h"


@interface PushValueViewController ()<BackDelegate>

@end

@implementation PushValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegateBtn.backgroundColor = [UIColor greenColor];
    self.blockBtn.backgroundColor = [UIColor greenColor];
    self.notificationBtn.backgroundColor = [UIColor greenColor];
    self.attributeBtn.backgroundColor = [UIColor greenColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//代理
- (IBAction)firstBtn:(id)sender {
    BackViewController * backControler = [[BackViewController alloc]init];
    //传递一个颜色
    backControler.delagate = self;
    [self.navigationController pushViewController:backControler animated:YES];
}

-(void)backColor:(UIColor *)titleColor title:(NSString *)titleStr{
    [self.delegateBtn setTitle:titleStr forState:UIControlStateNormal];
    self.delegateBtn.backgroundColor = titleColor;
}


//block
- (IBAction)secondBtn:(id)sender {
    __weak typeof(self) weakSelf = self;
    BackViewController * backControler = [[BackViewController alloc]init];

    [backControler setDidPushBlock:^(NSString *titleStr,UIColor *titleColr){
        [weakSelf.blockBtn setTitle:titleStr forState:UIControlStateNormal];
        weakSelf.blockBtn.backgroundColor = titleColr;
    }];
    [self.navigationController pushViewController:backControler animated:YES];
}


//通知
- (IBAction)thridBtn:(id)sender {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pushNotification:) name:@"PushNotification" object:nil];
    BackViewController * backControler = [[BackViewController alloc]init];
    [self.navigationController pushViewController:backControler animated:YES];
}
- (void)pushNotification:(NSNotification *)notification{
    [self.notificationBtn setTitle:notification.userInfo[@"title"] forState:UIControlStateNormal];
    self.notificationBtn.backgroundColor = notification.userInfo[@"color"];
}



//属性
- (IBAction)fourthBtn:(id)sender {
    BackViewController * backControler = [[BackViewController alloc]init];
    //传递一个颜色
    backControler.attributeColr = [UIColor redColor];
    [self.navigationController pushViewController:backControler animated:YES];
    
}
@end
