//
//  MoviePlayViewController.m
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

#import "MoviePlayViewController.h"
#import <WebKit/WebKit.h>
#import "ZHAlertView.h"

@interface MoviePlayViewController ()<WKNavigationDelegate>
@property (nonatomic, strong)WKWebView *wkWeb;
@property (nonatomic, strong)UIProgressView *progressView;


@end

@implementation MoviePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"播放页";
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"传递过来的url--%@", self.urlStr);
    
    [self createWKWebView];
}
- (void)createWKWebView{
    self.wkWeb = [[WKWebView alloc]initWithFrame:CGRectMake(0, STATUS_HEIGHT + NAV_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_HEIGHT - STATUS_HEIGHT)];
    self.wkWeb.navigationDelegate = self;
    self.wkWeb.backgroundColor = [UIColor whiteColor];
    [self.wkWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
    [self.view addSubview:self.wkWeb];
    // 添加进度条
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, NAV_HEIGHT + STATUS_HEIGHT, CGRectGetWidth(self.view.frame), 5)];
    [self.progressView setTrackTintColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0]];
    self.progressView.progressTintColor = [UIColor redColor];
    [self.view addSubview:self.progressView];
    // 给webview添加监听
    [self.wkWeb addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];

}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqual:@"estimatedProgress"] && object == self.wkWeb) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.wkWeb.estimatedProgress animated:YES];
        if (self.wkWeb.estimatedProgress  >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:YES];
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
- (void)dealloc{
    [self.wkWeb removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.wkWeb setNavigationDelegate:nil];
    [self.wkWeb setUIDelegate:nil];
    NSLog(@"%s", __func__);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"准备加载页面");
}
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"开始加载内容");
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"页面加载完成");
}
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    [ZHAlertView showOneBtnAlertViewWithMessage:@"加载失败, 请查看输入的视频地址是否正确" enterClick:^(NSString *zhString) {
        
    } andController:self];
    NSLog(@"页面加载失败, 原因是--%@", error);
}


@end
