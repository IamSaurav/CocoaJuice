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
    
    //Push
    [stack push:@"Hello"];
    [stack push:@"Hi"];
    [stack push:@"Hey"];
    [stack push:@"Let's Do"];
    [stack push:[NSNumber numberWithInt:1]];
    [stack push:[NSDictionary dictionaryWithObject:@"Tim" forKey:@"Cook"]];
    
    //Pop
    id obj = [stack pop];
    NSLog(@"Popped : %@\n",obj);
    
    //Convert to Array
    NSLog(@"Stack To Array : \n");
    NSArray *array = [stack toArray];
    for (int i=0; i<array.count; i++) {
        NSLog(@"%@\n",[array objectAtIndex:i]);
    }
    
    //Reverse Stack
    NSLog(@"Reversed Stack : \n");
    array = [stack reverseStack];
    for (int i=0; i<array.count; i++) {
        NSLog(@"%@\n",[array objectAtIndex:i]);
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
