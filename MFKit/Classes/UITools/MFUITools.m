//
//  MFUITools.m
//  MFPro
//
//  Created by achaoacwang on 2022/2/15.
//  Copyright © 2022 suggest.decision All rights reserved.
//

#import "MFUITools.h"
#import "MFVariableButton.h"

@implementation MFUITools

+ (UILabel *)createLabel:(UIView *)superView
                   frame:(CGRect)frame
                    text:(NSString *_Nullable)text
               textColor:(UIColor *)color
                    font:(UIFont *)font
               alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.textAlignment = alignment;
    [superView addSubview:label];
    return label;
}

+ (UIButton *)createButton:(UIView *)superView frame:(CGRect)frame title:(NSString *_Nullable)title target:(id)target selector:(SEL)selector {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    [superView addSubview:btn];
    return btn;
}

+ (UIButton *)createButton:(UIView *)superView frame:(CGRect)frame image:(NSString *)imageName target:(id)target selector:(SEL)selector {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [superView addSubview:btn];
    return btn;
}

+ (UIButton *)createVariableButton:(UIView *)spView
                             frame:(CGRect)frame
                             title:(NSString *_Nullable)title
                             image:(UIImage *_Nullable)image
                         titleRect:(CGRect)titleRect
                         imageRect:(CGRect)imageRect
                              font:(UIFont *_Nullable)font
                        titleColor:(UIColor *_Nullable)color
                            target:(id)target
                          selector:(SEL)selector {
    return [MFVariableButton buttonWithSuperView:spView
                                           frame:frame
                                           title:title
                                           image:image
                                       titleRect:titleRect
                                       imageRect:imageRect
                                            font:font
                                      titleColor:color
                                          target:target
                                        selector:selector];
}

+ (UIImageView *)createImage:(UIView *)superView frame:(CGRect)frame {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    [superView addSubview:imageView];
    return imageView;
}

+ (UIImageView *)createImage:(UIView *)superView frame:(CGRect)frame image:(NSString *)imgName {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    imageView.image = [UIImage imageNamed:imgName];
    [superView addSubview:imageView];
    return imageView;
}

+ (UIImageView *)createImage:(UIView *)superView frame:(CGRect)frame corner:(float)corner border:(float)border borderColor:(UIColor * _Nullable)borderColor {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.layer.masksToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    if (corner > 0) {
        imageView.layer.cornerRadius = corner;
    }
    if (border > 0) {
        imageView.layer.borderWidth = border;
        imageView.layer.borderColor = borderColor.CGColor;
    }
    [superView addSubview:imageView];
    return imageView;
}

+ (UIView *)createView:(UIView *)superView frame:(CGRect)frame bgColor:(UIColor *)color {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    [superView addSubview:view];
    return view;
}

+ (UIView *)addLineView:(UIView *)superView frame:(CGRect)frame lineColor:(UIColor *)color {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    view.backgroundColor = color;
    [superView addSubview:view];
    return view;
}

+ (UIView *)addPublicLine:(UIView *)spView frame:(CGRect)frame {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    UIImage *image = [UIImage imageNamed:@"mf_public_line"];
#ifdef DEBUG
    if (!image) {
        NSLog(@"%s 工程内没有命名为\"mf_public_line\"的图片！！！",__func__);
    }
#endif
    imgView.image = image;
    [spView addSubview:imgView];
    return imgView;
}

+ (UIVisualEffectView *)createBlurEffect:(UIView *)spView style:(UIBlurEffectStyle)style frame:(CGRect)frame {
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = frame;
    [spView addSubview:effectView];
    return effectView;
}

@end
