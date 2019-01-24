//
//  ViewController.m
//  iOSVipVideoForFree
//
//  Created by ZH on 2019/1/24.
//  Copyright © 2019 张豪. All rights reserved.
//

#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define STATUS_HEIGHT           [[UIApplication sharedApplication] statusBarFrame].size.height
#define NAV_HEIGHT              self.navigationController.navigationBar.frame.size.height
#define TABBAR_HEIGHT           self.tabBarController.tabBar.frame.size.height
#define ZHView_x(view)          view.frame.origin.x
#define ZHView_y(view)          view.frame.origin.y
#define ZHView_height(view)     view.bounds.size.height
#define ZHView_width(view)      view.bounds.size.width
#define ZHView_right(view)      view.frame.origin.x+view.bounds.size.width
#define ZHView_bottom(view)     view.frame.origin.y+view.bounds.size.height

#import "ViewController.h"
#import "ZHPickerView.h"

@interface ViewController ()
@property (nonatomic, strong)NSArray *APIArrays;
@property (nonatomic, strong)ZHPickerView *pkView;
@property (nonatomic, strong)UITextField *apiTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    [self initApiArrays];
    [self createMainUI];
    
}
// 创建主UI
- (void)createMainUI{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 80, 40)];
    titleLabel.text = @"API地址: ";
    titleLabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:titleLabel];
    self.apiTextField = [[UITextField alloc]initWithFrame:CGRectMake(ZHView_right(titleLabel), ZHView_y(titleLabel), SCREEN_WIDTH - 100 - 10, ZHView_height(titleLabel))];
    self.apiTextField.backgroundColor = [UIColor cyanColor];
    self.apiTextField.placeholder = @"点击选择API地址";
    [self.view addSubview:self.apiTextField];
    UITapGestureRecognizer *apiTextFieldTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(apiTextFieldTapGesture:)];
    [self.apiTextField addGestureRecognizer:apiTextFieldTap];
    
}
- (void)apiTextFieldTapGesture:(UITapGestureRecognizer *)gesture{
    NSLog(@"---%@",self.apiTextField.text);
    [self createPickerView];
}
// 创建pickerView
- (void)createPickerView{
    __weak __typeof__(self) weakSelf = self;
    self.pkView = [[ZHPickerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 220, SCREEN_WIDTH, 200) DataArr:self.APIArrays andTitle:nil];
    self.pkView.backgroundColor = [UIColor orangeColor];
    self.pkView.confirmBtnClick = ^(NSString *nameStr) {
        NSLog(@"点击了确定选中的内容是--%@", nameStr);
        [weakSelf.pkView removeFromSuperview];
        weakSelf.pkView = nil;
        if (nameStr == nil) {
            weakSelf.apiTextField.text = @"www.82190555.com/index/qqvod.php?url=";
        }else{
            weakSelf.apiTextField.text = nameStr;
        }
    };
    
    self.pkView.cancelBtnClick = ^{
        NSLog(@"点击了取消按钮");
        [weakSelf.pkView removeFromSuperview];
        weakSelf.pkView = nil;
    };
    [self.view addSubview:self.pkView];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了屏幕");
    if (self.pkView) {
        NSLog(@"存在");
        [self.pkView removeFromSuperview];
        self.pkView = nil; // 释放pkView

    }else{
        NSLog(@"不存在");
    }
}

- (void)initApiArrays{
    self.APIArrays = [NSArray arrayWithObjects: @"www.82190555.com/index/qqvod.php?url=", @"jiexi.92fz.cn/player/vip.php?url=", @"jiexi.071811.cc/jx2.php?url=", @"api.wlzhan.com/sudu/?url=", @"beaacc.com/api.php?url=", @"www.662820.com/xnflv/index.php?url=", @"qxkkk.bid/jx/jx.php?url=", @"www.27v9.cn/index.php?url=", @"www.ckplayer.tv/kuku/?url=", @"o8ve.cn/1/?url=", @"api.xyingyu.com/?url=", @"mlxztz.com/vip/?url=", @"kkk.2016ve.cn/kkjx/index.php?url=", @"api.lvcha2017.cn/?url=", @"www.aktv.men/?url=", @"jy777.cn/XSD/XSD/?url=", @"api.visaok.net/?url=", @"api.xyingyu.com/?url=", @"api.lldyy.net/svip/?url=", @"api.greatchina56.com/?url=", @"jx.618g.com/?url=", @"api.baiyug.vip/index.php?url=", @"jx.jfysz.cn/jx.php/?url=", @"jx.ektao.cn/jx.php/?url=", @"jx.reclose.cn/jx.php/?url=", @"jx.eayn.org.cn/jx.php/?url=", @"api.xyingyu.com/?url=", @"jx.iaeec.cn/jx.php/?url=", @"jx.83y4n7a.cn/jx.php/?url=", @"jx.cmbzzs.cn/jx.php/?url=", @"api.greatchina56.com/?url=", @"jx.as19811.cn/jx.php/?url=", @"jx.sdjnd09.cn/jx.php/?url=", @"api.baiyug.vip/index.php?url=", @"jx.09876as.cn/jx.php/?url=", @"jx.17ktv.com.cn/jx.php/?url=", @"jx.ab78a.cn/jx.php/?url=", @"jx.09877as.cn/jx.php/?url=", @"jx.yipolo111.cn/jx.php/?url=", @"jx.908astbb.cn/jx.php/?url=", @"jx.dlzyrk001.cn/jx.php/?url=", @"jx.dccmy.org.cn/jx.php/?url=", @"jx.boctx.cn/jx.php/?url=", @"jx.hxbte.cn/jx.php/?url=", @"api.visaok.net/?url=", @"jx.618g.com/?url=", @"yun.baiyug.cn/vip/?url=", @"api.baiyug.cn/vip/?url=", @"api.xfsub.com/index.php?url=", @"api.xfsub.com/index.php?url=", @"jiexi.071811.cc/jx2.php?url=", @"player.jidiaose.com/supapi/iframe.php?v=", @"www.82190555.com/index/qqvod.php?url=", @"api.pucms.com/?url=", @"api.baiyug.cn/vip/index.php?url=", @"www.82190555.com/index/qqvod.php?url=", @"2gty.com/apiurl/yun.php?url=", @"v.2gty.com/apiurl/yun.php?url=", nil];
    NSLog(@"arr -- %@", self.APIArrays);

}


@end
