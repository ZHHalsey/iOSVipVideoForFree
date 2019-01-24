//
//  hintView.m
//  iOSVipVideoForFree
//
//  Created by ZH on 2019/1/24.
//  Copyright © 2019 张豪. All rights reserved.
//

#import "hintView.h"

@implementation hintView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
         [self createUI];
    }
    return self;
}
- (void)createUI{
    UILabel *hintLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, self.bounds.size.width - 10, self.bounds.size.height - 10)];
//    hintLable.backgroundColor = [UIColor yellowColor];
    hintLable.text = @"温馨提示:\n    如果不能正常播放视频的话, 选择其他的API地址, 重新进行播放";
    hintLable.font = [UIFont systemFontOfSize:18];
    hintLable.textColor = [UIColor blueColor];
    hintLable.numberOfLines = 0;
    [self addSubview:hintLable];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
