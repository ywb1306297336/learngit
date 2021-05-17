//
//  WMUWebViewController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/15.
//

#import "WMUWebViewController.h"
#import <WebKit/WebKit.h>
#import "WMUQuestion.h"

@interface WMUWebViewController () <WKNavigationDelegate>
@end

@implementation WMUWebViewController
-(void)loadView {
    WKWebView *webView = [[WKWebView alloc] init];
    self.view = webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //尝试加载一个网页
    WKWebView *wbView = (WKWebView *)self.view;
    //设置代理
//    wbView.navigationDelegate = self;
    //1.创建一个要加载网页的url
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.question.html withExtension:nil];
    //2.创建一个请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3.指定让wbView加载某个请求对象
    [wbView loadRequest:request];
}
////页面加载完成后调用
//-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    //1.编写要执行的代码
//    NSString *jsCode = [NSString stringWithFormat:@"document.location.href = '#%@';", self.question.ID];
//    //2.根据jsCode初始化WKUserScript对象
//    WKUserScript *script = [[WKUserScript alloc] initWithSource:jsCode injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
//    //3.根据生成的WKUserScript对象, 初始化WKWebViewConfiguration
//    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
//    [config.userContentController addUserScript:script];
//    webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
//}
@end
