//
//  AppDelegate.m
//  MyApp
//
//  Created by hcl on 2022/9/7.
//

#import "AppDelegate.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import <flutter_boost/FlutterBoost.h>
#import "MyNavigationController.h"

#import "FlutterController.h"
#import "NativeViewController.h"
#import "UIViewControllerDemo.h"
#import "MyFlutterBoostDelegate.h"
#import "FLNativeView.h"
#import "MyTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//- (BOOL)application:(UIApplication *)application
//    didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
//  self.flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
//  // Runs the default Dart entrypoint with a default Flutter route.
//  [self.flutterEngine run];
//  // Used to connect plugins (only if you have plugins with iOS platform code).
//  [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
//    FlutterController *vc = [[FlutterController alloc] initWithEngine:self.flutterEngine nibName:nil bundle:nil];
//    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectZero];
//    window.windowLevel = UIWindowLevelNormal - 1;
//    [window setRootViewController:vc];
//    [window makeKeyAndVisible];
//    [self performSelector:@selector(dismissWindow:) withObject:window afterDelay:1.0];
//  return [super application:application didFinishLaunchingWithOptions:launchOptions];
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    //默认方法
    MyFlutterBoostDelegate *delegate = [[MyFlutterBoostDelegate alloc ] init];
    [[FlutterBoost instance] setup:application delegate:delegate callback:^(FlutterEngine *engine) {
        NSObject<FlutterPluginRegistrar>* registrar = [engine registrarForPlugin:@"plugin-name"];
        FLNativeViewFactory *factory = [[FLNativeViewFactory alloc] initWithMessenger:registrar.messenger];
        [[engine registrarForPlugin:@"<plugin-name>"] registerViewFactory:factory withId:@"<simple-text-view>"];
    }];

    //下面是自定义option参数的方法

//    FlutterBoostSetupOptions* options = [FlutterBoostSetupOptions createDefault];
//    options.dartEntryPoint = @"main2";
//
//    [[FlutterBoost instance] setup:application delegate:delegate callback:^(FlutterEngine *engine) {
//    } options:options];

//    UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
//    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hybrid_tab" image:nil tag:0];
//    UINavigationController *nav0 = [[UINavigationController alloc] initWithRootViewController:vc];
//
//    FBFlutterViewContainer *fvc = [FBFlutterViewContainer new];
//    [fvc setName:@"mainPage" uniqueId:nil params:@{} opaque:YES];
//    fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"flutter_tab" image:nil tag:1];
//    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:fvc];
//
//    UITabBarController *tabVC = [[UITabBarController alloc] init];
//    tabVC.viewControllers = @[nav0,nav1];
//
//    UINavigationController *rvc = [[UINavigationController alloc] initWithRootViewController:tabVC];

    delegate.navigationController = [MyNavigationController new];

    MyTabBarController *tabbarVC = [MyTabBarController new];
    self.window.rootViewController = tabbarVC;


//    UIButton *nativeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    nativeButton.frame = CGRectMake(self.window.frame.size.width * 0.5 - 50, 200, 100, 40);
//    nativeButton.backgroundColor = [UIColor redColor];
//    [nativeButton setTitle:@"push native" forState:UIControlStateNormal];
//    [nativeButton addTarget:self action:@selector(pushNative) forControlEvents:UIControlEventTouchUpInside];
//    [self.window addSubview:nativeButton];
//
//    UIButton *pushEmbeded = [UIButton buttonWithType:UIButtonTypeCustom];
//    pushEmbeded.frame = CGRectMake(self.window.frame.size.width * 0.5 - 70, 150, 140, 40);
//    pushEmbeded.backgroundColor = [UIColor redColor];
//    [pushEmbeded setTitle:@"push embedded" forState:UIControlStateNormal];
//    [pushEmbeded addTarget:self action:@selector(pushEmbeded) forControlEvents:UIControlEventTouchUpInside];
//    [self.window addSubview:pushEmbeded];


    return YES;
}

- (void)pushNative
{
    UINavigationController *nvc = (id)self.window.rootViewController;
    UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
    [nvc pushViewController:vc animated:YES];
}
//
- (void)pushEmbeded
{
    UINavigationController *nvc = (id)self.window.rootViewController;
    UIViewController *vc = [[NativeViewController alloc] init];
    [nvc pushViewController:vc animated:YES];
}

@end
