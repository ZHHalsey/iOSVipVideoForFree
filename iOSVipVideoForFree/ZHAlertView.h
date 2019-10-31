//
//  ZHAlertView.h
//  ZHAlertView
//
//  Created by ZZZZZ on 16/10/10.
//  Copyright © 2016年 张豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZHAlertView : NSObject

/**
 * 显示一个按钮的弹窗提示框
 */
+ (void)showOneBtnAlertViewWithMessage:(NSString *)message
                            enterClick:(void(^)(NSString *zhString))btnClick
                         andController:(UIViewController *)controller;

/**
 * 显示两个按钮的弹窗提示框
 */
+ (void)showTwoBtnAlertViewWithMessage:(NSString *)message
                          btnLeftTitle:(NSString *)btnLeftTitle
                         btnRightTitle:(NSString *)btnRightTitle
                            LeftBtnClick:(void(^)(NSString *zhString))btnOneClick
                           RightBtnClick:(void(^)(NSString *zhString1))btnTwoClick
                         andController:(UIViewController *)viewController;

/**
 * 从底部弹出两个选项的提示框(可以任意的加按钮)
 */
+ (void)showTwoBtnSheetViewWithMessage:(NSString *)message
                            btnUpTitle:(NSString *)btnUpTitle
                          btnDownTitle:(NSString *)btnDownTitle
                         btnDownTitle1:(NSString *)btnDown1Title
                            enterClick:(void(^)())btnUpClick
                           cancelClick:(void(^)())btnDownClick
                          cancel1Click:(void(^)())btnDown1Click
                         andController:(UIViewController *)viewController;


@end
