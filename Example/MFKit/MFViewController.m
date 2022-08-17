//
//  MFViewController.m
//  MFKit
//
//  Created by achaoac on 08/17/2022.
//  Copyright (c) 2022 achaoac. All rights reserved.
//

#import "MFViewController.h"
//#import <MFUIKit/MFKitHeader.h>
#import "MFKitHeader.h"

@interface MFViewController ()

@end

@implementation MFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [MFUITools createVariableButton:self.view frame:CGRectMake(20, 80, 100, 40) title:@"可变按钮" image:[UIImage imageNamed:@"btn_test1"] titleRect:CGRectMake(5, 10, 55, 20) imageRect:CGRectMake(70, 5, 30, 30) font:[UIFont systemFontOfSize:13] titleColor:UIColor.blueColor target:self selector:@selector(variableButtonAction)];
    btn.backgroundColor = UIColor.grayColor;
    
    NSArray *arr = @[@"Toast", @"Aleart"];
    for (int i = 0; i < arr.count; i++) {
        UIButton *btn = [MFUITools createButton:self.view frame:CGRectMake(20, 160 + i * 80, 100, 40) title:arr[i] target:self selector:@selector(buttonClickAction:)];
        btn.tag = i;
        btn.backgroundColor = UIColor.blueColor;
    }
}

- (void)variableButtonAction {
    NSLog(@"variableButtonAction");
}

- (void)buttonClickAction:(UIButton *)btn {
    int tag = (int)btn.tag;
    switch (tag) {
        case 0: {
            [MFToastView showToast:@"展示Toast"];
        }
            break;
        case 1: {
            [MFAleartView creaetAlertView:self.view title:@"这是Aleart" content:@"这是一个Aleart，可以点击取消和确定按钮，确定按钮点击是否移除Aleart可以控制。" cancel:@"取消" confirm:@"确定" complete:^{
                NSLog(@"确定按钮点击");
            } cancelBlock:^{
                NSLog(@"取消按钮点击");
            }];
        }
            break;
            
        default:
            break;
    }
}

- (void)buttonClickAction1 {
    [MFToastView showToast:@"展示Toast"];
}

@end
