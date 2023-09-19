//// 
//  ViewController.m
//  
//  Created by coooliang on 2023/7/6
//

#import "ViewController.h"
#import "CLRouter.h"
#import "RouterHeader.h"

@interface User : NSObject

@end

@implementation User

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *testButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    [testButton setTitle:@"test" forState:UIControlStateNormal];
    [testButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:testButton];
    [testButton addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *testButton2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 40)];
    [testButton2 setTitle:@"test2" forState:UIControlStateNormal];
    [testButton2 setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:testButton2];
    [testButton2 addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)test {
    [[CLRouter router]route:Home];
    [[CLRouter router]route:Fortune];
    [[CLRouter router]route:Wallet];
    [[CLRouter router]route:Account];
    
    [[CLRouter router]route:NextStep parameter:@{@"a":@"1"}];
    [[CLRouter router]route:NextStep parameter:[User new]];
}

- (void)test2 {
    [[CLRouter router]route:Home];
}

@end



