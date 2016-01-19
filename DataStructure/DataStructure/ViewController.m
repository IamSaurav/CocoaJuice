//
//  ViewController.m
//  DataStructure
//
//  Created by Saurav Satpathy on 18/01/16.
//  Copyright © 2016 Saurav Satpathy. All rights reserved.
//

#import "CJStack.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CJStack *stack = [[CJStack alloc]init];
    [stack push:@"Hello"];
    [stack push:@"Hi"];
    [stack push:@"Hey"];
    [stack push:@"Let's Do"];
    
    for (int i=0; i<5; i++) {
        NSLog(@"%@",[stack pop]);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
