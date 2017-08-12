//
//  BackViewController.m
//  PushValue
//
//  Created by 张江威 on 2017/8/12.
//  Copyright © 2017年 YoungMonk. All rights reserved.
//

#import "BackViewController.h"
#import "PushValueViewController.h"


@interface BackViewController ()
- (IBAction)firstBtn:(id)sender;
- (IBAction)secondBtn:(id)sender;
- (IBAction)thridBtn:(id)sender;
- (IBAction)fourthBtn:(id)sender;

@end

@implementation BackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegateBtn.backgroundColor = [UIColor redColor];
    self.blockBtn.backgroundColor = [UIColor redColor];
    self.notificationBtn.backgroundColor = [UIColor redColor];
    self.attributeBtn.backgroundColor = _attributeColr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//代理
- (IBAction)firstBtn:(id)sender {
    [self.delagate backColor:[UIColor redColor] title:@"代理成功"];
    [self.navigationController popViewControllerAnimated:YES];
}

//block
- (IBAction)secondBtn:(id)sender {
    __weak typeof(self) weakSelf = self;
    
    if (weakSelf.didPushBlock != nil) {
        weakSelf.didPushBlock( @"block成功",[UIColor redColor]);
    }
    [self.navigationController popViewControllerAnimated:YES ];
}

//通知
- (IBAction)thridBtn:(id)sender {
    NSDictionary *dict = @{@"color":[UIColor redColor], @"title":@"通知成功"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PushNotification" object:nil userInfo:dict];
    
    //    [[NSNotificationCenter defaultCenter]postNotificationName:@"PushBlock" object:nil];
    [self.navigationController popViewControllerAnimated:YES ];
}
//属性
- (IBAction)fourthBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
