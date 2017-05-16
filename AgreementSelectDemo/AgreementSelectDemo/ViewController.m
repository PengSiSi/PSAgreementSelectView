//
//  ViewController.m
//  AgreementSelectDemo
//
//  Created by 思 彭 on 2017/5/16.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "ViewController.h"
#import "AgreementSelectView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AgreementSelectView *selectView = [[AgreementSelectView alloc]initWithAgreementSelectViewFrame:CGRectMake(10, 100, 300, 40) text: nil textFont:nil attributeTextColor:[UIColor orangeColor] normalButtonImage:nil selectedButtonImage:nil selectButtonSize:CGSizeMake(20, 20) textLabelLeftMargin:10];
    
    // 需要设置富文本的字符串
    selectView.attributeText = @"<<好业宝平台服务协议>> <<好业宝禁售产品协议>>";
    [self.view addSubview:selectView];
    selectView.selectButtonBlock = ^(BOOL isSelected) {
        if (isSelected == YES) {
            NSLog(@"选中");
        } else {
            NSLog(@"没有勾选,请先勾选哟!!!");
        }
    };
    selectView. textBlock = ^{
        NSLog(@"点击了文字链接哟!!!");
    };
}


@end
