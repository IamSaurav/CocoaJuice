//
//  ViewController.m
//  Nothing
//
//  Created by Saurav Satpathy on 05/07/15.
//  Copyright (c) 2015 Saurav Satpathy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
#pragma mark-----------NULL------------
    
    
    int *count = NULL;

#pragma mark-----------nil------------

    NSString *name = nil;
    
#pragma mark-----------Nil------------
    
    Class aClass = Nil;
    
#pragma mark-----------NSNull------------
    
    NSMutableDictionary *Address = [NSMutableDictionary dictionary];
    /// nil can't be assigned, in run time it will crash

    /*[Address setObject:nil forKey:@"Phone"];*/
    [Address setObject:[NSNull null] forKey:@"Phone"];
    [Address setObject:@"123456" forKey:@"Phone"];
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
