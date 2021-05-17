//
//  WMUWebViewController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/6.
//

#import "WMUWebViewController.h"
#import <WebKit/WebKit.h>
@interface WMUWebViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
/** webView */
@property (nonatomic, weak) WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@end

@implementation WMUWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webView = [[WKWebView alloc] init];
    self.webView = webView;
    [self.contentView addSubview:webView];
    //展示网页
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [webView loadRequest:request];
    //利用KVO来监听前进后退是否有点击
    [webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}
//只要观察对象属性有新值就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.backItem.enabled = self.webView.canGoBack;
    self.forwardItem.enabled = self.webView.canGoForward;
    self.title = self.webView.title;
    self.progressView.progress = self.webView.estimatedProgress;
    //进度条满之后隐藏
    self.progressView.hidden = self.webView.estimatedProgress >= 1;
}
//一旦使用KVO一定要记得销毁
- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.webView.frame = self.contentView.bounds;
}
- (IBAction)didClickBackItem:(id)sender {
    [self.webView goBack];
}
- (IBAction)didClickForwardItem:(id)sender {
    [self.webView goForward];
}
- (IBAction)didClickReloadItem:(id)sender {
    [self.webView reload];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
