//
//  BackViewController.h
//  PushValue
//
//  Created by 张江威 on 2017/8/12.
//  Copyright © 2017年 YoungMonk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackDelegate <NSObject>

-(void)backColor:(UIColor *)titleColor title:(NSString *)titleStr;

@end

@interface BackViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *delegateBtn;
@property (weak, nonatomic) IBOutlet UIButton *blockBtn;
@property (weak, nonatomic) IBOutlet UIButton *notificationBtn;
@property (weak, nonatomic) IBOutlet UIButton *attributeBtn;

@property (strong, nonatomic) UIColor * attributeColr;

@property (assign, nonatomic) id <BackDelegate>delagate;

@property (nonatomic, copy) void (^didPushBlock)(NSString *titleStr,UIColor *titleColr);


@end
