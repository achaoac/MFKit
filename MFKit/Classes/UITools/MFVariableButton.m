//
//  MFVariableButton.m
//  MFPro
//
//  Created by achaoacwang on 2022/2/15.
//  Copyright © 2022 suggest.decision All rights reserved.
//

#import "MFVariableButton.h"

@interface MFVariableButton ()

@property (nonatomic,assign) CGRect titleRect;
@property (nonatomic,assign) CGRect imageRect;

@end

@implementation MFVariableButton

+ (instancetype)buttonWithSuperView:(UIView *)spView
                              frame:(CGRect)frame
                              title:(NSString *)title
                              image:(UIImage *)image
                          titleRect:(CGRect)titleRect
                          imageRect:(CGRect)imageRect
                               font:(UIFont *)font
                         titleColor:(UIColor *)color
                             target:(id)target
                           selector:(SEL)selector {
    MFVariableButton *btn = [super buttonWithType:UIButtonTypeCustom];
    if (btn) {
        btn.titleRect = titleRect;
        btn.imageRect = imageRect;
        if (image) {
            [btn setImage:image forState:UIControlStateNormal];
        }
        if (title) {
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn setTitle:title forState:UIControlStateNormal];
            btn.titleLabel.font = font;
            [btn setTitleColor:color forState:UIControlStateNormal];
            [btn setTitleColor:[color colorWithAlphaComponent:0.7] forState:UIControlStateHighlighted];
        }
        [btn setFrame:frame];
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    if (spView) {
        [spView addSubview:btn];
    }
    return btn;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [super titleRectForContentRect:contentRect];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [super imageRectForContentRect:contentRect];
}


@end
