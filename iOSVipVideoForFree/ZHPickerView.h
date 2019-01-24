//
//  ZHPickerView.h
//  ZHPickerView
//
//  Created by ZH on 2018/8/10.
//  Copyright © 2018年 张豪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ConfirmBtnClickBlock)(NSString *nameStr);
typedef void(^CancelBtnClickBlock)(void);


@interface ZHPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong)ConfirmBtnClickBlock confirmBtnClick;
@property (nonatomic, strong)CancelBtnClickBlock cancelBtnClick;

@property (nonatomic, strong)NSArray *dataArr;
@property (nonatomic, copy)NSString *selectStr;


- (instancetype)initWithFrame:(CGRect)frame DataArr:(NSArray *)dataArr andTitle:(NSString *)titleStr;

@end
