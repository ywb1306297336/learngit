//
//  SceneDelegate.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/6.
//

#import "SceneDelegate.h"
#import "WMUMainTabBarController.h"
#import "WMUGuideController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    //1.创建UIWindow
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.windowScene = (UIWindowScene *)scene;
    [self chooseStartViewController];
    //统一设置导航栏外观
    [self setNavigationBarStyle];
    //统一设置状态栏外观
//    [self setStatusBarstyle];
    //4.设置self.window为主窗口并显示
    [self.window makeKeyAndVisible];
}
//选择启动控制器
-(void)chooseStartViewController {
    //1.获取当前app版本号
    NSString *current_ver = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    //2.获取保存在偏好设置中的版本号
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *app_ver = [userDefaults objectForKey:@"app_ver"];
    //3.比较偏好设置中保存的版本号是否和当前app的版本号一致
    //如果版本号一致, 表示此app没有更新过
    //如果版本号不一致, 表示此app第一次使用或更新后第一次使用
    if ([current_ver isEqualToString:app_ver]) {
        //表示不是第一次启动也不是更新后第一次启动
        //创建UITabBarController
        WMUMainTabBarController *mainVC = [[WMUMainTabBarController alloc] init];
        //设置UIWindow的根控制器
        self.window.rootViewController = mainVC;
    } else {
        WMUGuideController *guideC = [[WMUGuideController alloc] init];
        self.window.rootViewController = guideC;
    }
    //无论是否是第一次启动, 都要把当前版本号写入"偏好设置"中
    [userDefaults setObject:current_ver forKey:@"app_ver"];
    [userDefaults synchronize];
}
//统一设置导航栏外观
-(void)setNavigationBarStyle {
    //1.获取导航栏外观的代理对象
    UINavigationBar *bar = [UINavigationBar appearance];
    //2.统一设置外观效果
    //2.1设置背景图
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    //2.2设置标题栏文字
    NSDictionary *attrs = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:20]};
    [bar setTitleTextAttributes:attrs];
}
- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
