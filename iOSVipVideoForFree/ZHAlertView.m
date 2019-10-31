//
//  ZHAlertView.m
//  ZHAlertView
//
//  Created by ZZZZZ on 16/10/10.
//  Copyright © 2016年 张豪. All rights reserved.
//

#import "ZHAlertView.h"

@implementation ZHAlertView

// 弹出一个提示框,一个按钮
+ (void)showOneBtnAlertViewWithMessage:(NSString *)message
                            enterClick:(void(^)(NSString *zhString))btnClick
                         andController:(UIViewController *)controller{
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert]; // 弹窗
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        btnClick(@"111");
    }];
    [alertCon addAction:action1];
    [controller presentViewController:alertCon animated:YES completion:nil];
}

// 弹出一个提示框, 两个按钮
+ (void)showTwoBtnAlertViewWithMessage:(NSString *)message
                          btnLeftTitle:(NSString *)btnLeftTitle
                         btnRightTitle:(NSString *)btnRightTitle
                          LeftBtnClick:(void(^)(NSString *zhString))btnOneClick
                         RightBtnClick:(void(^)(NSString *zhString1))btnTwoClick
                         andController:(UIViewController *)viewController{

    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert]; // 弹窗
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:btnLeftTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        btnOneClick(@"1111");
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:btnRightTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        btnTwoClick(@"111");
    }];
    [alertCon addAction:action1];
    [alertCon addAction:action2];
    [viewController presentViewController:alertCon animated:YES completion:nil];
}

// 底部弹出一个提示框, 三个按钮
+ (void)showTwoBtnSheetViewWithMessage:(NSString *)message
                            btnUpTitle:(NSString *)btnUpTitle
                          btnDownTitle:(NSString *)btnDownTitle
                         btnDownTitle1:(NSString *)btnDown1Title
                            enterClick:(void(^)())btnUpClick
                           cancelClick:(void(^)())btnDownClick
                          cancel1Click:(void(^)())btnDown1Click
                         andController:(UIViewController *)viewController{
    
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleActionSheet]; // 弹窗
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:btnUpTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        btnUpClick();
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:btnDownTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        btnDownClick();
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:btnDown1Title style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        btnDown1Click();
    }];
    [alertCon addAction:action1];
    [alertCon addAction:action2];
    [alertCon addAction:action3];
    [viewController presentViewController:alertCon animated:YES completion:nil];
    
//    [ZHAlertView showTwoBtnSheetViewWithMessage:<#(NSString *)#> btnUpTitle:<#(NSString *)#> btnDownTitle:<#(NSString *)#> enterClick:<#^(NSString *zhString)btnUpClick#> cancelClick:<#^(NSString *zhString1)btnDownClick#> andController:<#(UIViewController *)#>]

}


@end
