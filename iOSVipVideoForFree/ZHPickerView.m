//
//  ZHPickerView.m
//  ZHPickerView
//
//  Created by ZH on 2018/8/10.
//  Copyright © 2018年 张豪. All rights reserved.
//
#define ZHView_x(view) view.frame.origin.x
#define ZHView_y(view) view.frame.origin.y
#define ZHView_height(view) view.bounds.size.height
#define ZHView_width(view) view.bounds.size.width
#define ZHView_right(view) view.frame.origin.x+view.bounds.size.width
#define ZHView_bottom(view) view.frame.origin.y+view.bounds.size.height

#import "ZHPickerView.h"

@implementation ZHPickerView

- (instancetype)initWithFrame:(CGRect)frame DataArr:(NSArray *)dataArr andTitle:(NSString *)titleStr{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArr = dataArr;
        // 上面右侧确定btn

        UIButton *btn = [UIButton buttonWithType:0];
        btn.frame = CGRectMake(self.bounds.size.width - 130, 0, 100, 40);
//        btn.backgroundColor = [UIColor cyanColor];
        [btn setTitle:@"完成" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        //上面左侧取消btn
        UIButton *btn1 = [UIButton buttonWithType:0];
        btn1.frame = CGRectMake(30, 0, 100, 40);
        [btn1 setTitle:@"取消" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(CancelbtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn1];

        
        // 中间的title
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, ZHView_bottom(btn), self.bounds.size.width - 20, 50)];
//        titleLabel.backgroundColor = [UIColor orangeColor];
        titleLabel.text = titleStr;
        titleLabel.textAlignment = 1;
        [self addSubview:titleLabel];
        
        // 下面的picker
        UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(10, 80, self.bounds.size.width - 20, self.bounds.size.height - 90)];
//        pickerView.backgroundColor = [UIColor redColor];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        [self addSubview:pickerView];

    }
    return self;
}

- (void)btnClick{
    if (self.confirmBtnClick) {
        self.confirmBtnClick(self.selectStr);
    }
}
- (void)CancelbtnClick{
    if (self.cancelBtnClick) {
        self.cancelBtnClick();
    }

}
#pragma mark - pickerView的  delegata 和 dataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    // 列
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    // 行
    return [self.dataArr count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.dataArr objectAtIndex:row];
}

// 进行传值
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectStr = [self.dataArr objectAtIndex:row];
}
- (void)dealloc{
    NSLog(@"%s", __func__);
}
@end
