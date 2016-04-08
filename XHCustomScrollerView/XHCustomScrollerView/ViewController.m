//
//  ViewController.m
//  XHCustomScrollerView
//
//  Created by 张锐 on 16/4/7.
//  Copyright © 2016年 张锐. All rights reserved.
//

#import "ViewController.h"
#import "CustomScrollerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomScrollerView *scr = [[CustomScrollerView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width , 240)
                                                              andArray:@[@"1.jpg",
                                                                         @"2.jpg",
                                                                         @"3.jpg",
                                                                         @"4.jpg",
                                                                         @"5.jpg"]];
    scr.stopTime = 2;
    
    [self.view addSubview:scr];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
