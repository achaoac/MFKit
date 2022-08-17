//
//  MFAleartView.h
//  MFPro
//
//  Created by achaoacwang on 2022/7/8.
//  Copyright © 2022 suggest.eat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MFAlertCompleteBlock)(void);
typedef void (^MFAlertCcancelBlock)(void);

@interface MFAleartView : UIView


/// 点击确认按钮是否自动移除 aleart，默认为 YES
@property (nonatomic, assign) BOOL confirmAutoRemove;

+ (MFAleartView *)creaetAlertView:(UIView *)spView title:(NSString * _Nullable)title content:(NSString * _Nullable)content cancel:(NSString * _Nullable)cancel confirm:(NSString * _Nullable)confirm complete:(MFAlertCompleteBlock _Nullable)block cancelBlock:(MFAlertCcancelBlock _Nullable)cancelBlock;

@end

NS_ASSUME_NONNULL_END
