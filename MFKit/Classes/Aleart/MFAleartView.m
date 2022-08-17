//
//  MFAleartView.m
//  MFPro
//
//  Created by achaoacwang on 2022/7/8.
//  Copyright © 2022 suggest.eat. All rights reserved.
//

#import "MFAleartView.h"
#import "MFUITools.h"

@interface MFAleartView ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, copy) MFAlertCompleteBlock complete;
@property (nonatomic, copy) MFAlertCompleteBlock cancelBlock;

@end

@implementation MFAleartView

+ (MFAleartView *)creaetAlertView:(UIView *)spView title:(NSString * _Nullable)title content:(NSString * _Nullable)content cancel:(NSString * _Nullable)cancel confirm:(NSString * _Nullable)confirm complete:(MFAlertCompleteBlock _Nullable)block cancelBlock:(MFAlertCcancelBlock _Nullable)cancelBlock {
    MFAleartView *v = [[MFAleartView alloc] initWithFrame:CGRectMake(0, 0, spView.frame.size.width, spView.frame.size.height) title:title content:content cancel:cancel confirm:confirm];
    v.complete = block;
    v.cancelBlock = cancelBlock;
    [spView addSubview:v];
    [v showAlertView];
    return v;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString * _Nullable)title content:(NSString * _Nullable)content cancel:(NSString *)cancel confirm:(NSString * _Nullable)confirm {
    self = [super initWithFrame:frame];
    if (self) {
        self.confirmAutoRemove = YES;
        [self _initViewTitle:title content:content cancel:cancel confirm:confirm];
    }
    return self;
}

- (void)_initViewTitle:(NSString * _Nullable)title content:(NSString * _Nullable)content cancel:(NSString *)cancel confirm:(NSString * _Nullable)confirm {
    self.backgroundColor = UIColor.clearColor;
    self.bgView = [MFUITools createView:self frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) bgColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
    self.bgView.alpha = 0;
    
    UIView *cView = [MFUITools createView:self.bgView frame:CGRectMake(40, 320, self.frame.size.width - 80, 176) bgColor:UIColor.whiteColor];
    cView.layer.cornerRadius = 12;
    cView.layer.masksToBounds = YES;
    
    UIColor *textColor = [UIColor colorWithRed:30 / 255.0 green:30 / 255.0 blue:30 / 255.0 alpha:1];
    NSTextAlignment desAlign = NSTextAlignmentCenter;
    float desY = 30;
    if (title.length > 0) {
        desAlign = NSTextAlignmentLeft;
        desY = 60;
        // 标题
        [MFUITools createLabel:cView frame:CGRectMake(20, 24, cView.frame.size.width - 40, 24) text:title textColor:textColor font:[UIFont fontWithName:@"PingFangSC-Medium" size:17] alignment:NSTextAlignmentCenter];
    }
    UILabel *desLab = [MFUITools createLabel:cView frame:CGRectMake(24, desY, cView.frame.size.width - 48, 24) text:content textColor:textColor font:[UIFont fontWithName:@"PingFangSC-Regular" size:15] alignment:desAlign];
    desLab.numberOfLines = 0;
    [desLab sizeToFit];
    if (title.length == 0) {
        [desLab setFrame:CGRectMake(24, desLab.frame.origin.y, cView.frame.size.width - 48, ceilf(desLab.frame.size.height))];
    }
    float y = CGRectGetMaxY(desLab.frame);
    
    float confirmX = 0;
    float confirmW = cView.frame.size.width;
    if (cancel.length > 0) {
        UIButton *cancelBtn = [MFUITools createButton:cView frame:CGRectMake(0, y + 24, cView.frame.size.width / 2.0, 47) title:cancel target:self selector:@selector(cancelButtonAction)];
        [cancelBtn setTitleColor:textColor forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[textColor colorWithAlphaComponent:0.8] forState:UIControlStateHighlighted];
        cancelBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        
        confirmX = cView.frame.size.width / 2.0;
        confirmW = cView.frame.size.width / 2.0;
        
        [MFUITools addPublicLine:cView frame:CGRectMake(cView.frame.size.width / 2.0, cancelBtn.frame.origin.y, 0.5, cancelBtn.frame.size.height)];
    }
    
    UIColor *confirmColor = [UIColor colorWithRed:255 / 255.0 green:73 / 255.0 blue:84 / 255.0 alpha:1];
    UIButton *confirmBtn = [MFUITools createButton:cView frame:CGRectMake(confirmX, y + 24, confirmW, 47) title:confirm target:self selector:@selector(confirButtonAction)];
    [confirmBtn setTitleColor:confirmColor forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[confirmColor colorWithAlphaComponent:0.8] forState:UIControlStateHighlighted];
    confirmBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    [MFUITools addPublicLine:cView frame:CGRectMake(0, confirmBtn.frame.origin.y, cView.frame.size.width, 0.5)];
    [cView setFrame:CGRectMake(40, (self.frame.size.height - CGRectGetMaxY(confirmBtn.frame)) / 2.0, self.frame.size.width - 80, CGRectGetMaxY(confirmBtn.frame))];
}

- (void)confirButtonAction {
    if (self.complete) {
        self.complete();
    }
    if (self.confirmAutoRemove) {
        [self removeAlertView];
    }
}

- (void)cancelButtonAction {
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    [self removeAlertView];
}

- (void)showAlertView {
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.alpha = 1;
    } completion:^(BOOL finished) {
    }];
}

- (void)removeAlertView {
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
