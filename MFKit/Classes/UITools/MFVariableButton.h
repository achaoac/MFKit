//
//  MFVariableButton.h
//  MFPro
//
//  Created by achaoacwang on 2022/2/15.
//  Copyright © 2022 suggest.decision All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 自定义可控制图片和标题位置的 button
@interface MFVariableButton : UIButton

/// 自定义 button
/// @param spView 父view
/// @param frame button 位置
/// @param title button 标题
/// @param image buttoon 图片
/// @param titleRect 标题位置
/// @param imageRect 图片位置
/// @param font 标题字体
/// @param color 标题颜色
/// @param target 执行的对象
/// @param selector 执行的方法
+(instancetype)buttonWithSuperView:(UIView *)spView
                             frame:(CGRect)frame
                             title:(NSString *)title
                             image:(UIImage *)image
                         titleRect:(CGRect)titleRect
                         imageRect:(CGRect)imageRect
                              font:(UIFont*)font
                        titleColor:(UIColor *)color
                            target:(id)target
                          selector:(SEL)selector;

@end

NS_ASSUME_NONNULL_END
