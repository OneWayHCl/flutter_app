//
//  ViewController.m
//  MyApp
//
//  Created by hcl on 2022/9/7.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <Flutter/Flutter.h>
#import "FlutterController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(showFlutter)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show Flutter!" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.blueColor;
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}

- (void)showFlutter {
    FlutterEngine *flutterEngine =
    ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    FlutterController *flutterViewController =
    [[FlutterController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
//    [self presentViewController:flutterViewController animated:YES completion:nil];
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

@end
