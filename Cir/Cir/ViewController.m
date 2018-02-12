//
//  ViewController.m
//  Cir
//
//  Created by LST_PRO on 2018/2/11.
//  Copyright © 2018年 LST_PRO. All rights reserved.
//

#import "ViewController.h"
#import "LNCirView.h"
#define FULL_WIDTH   [[UIScreen mainScreen] bounds].size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LNCirView  *cirView = [[LNCirView alloc] initWithFrame:CGRectMake(0, 100, FULL_WIDTH, 200)];
    [self.view addSubview:cirView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
