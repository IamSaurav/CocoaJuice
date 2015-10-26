//
//  ViewController.m
//  DataStructure
//
//  Created by Saurav Satpathy on 24/10/15.
//  Copyright © 2015 Saurav Satpathy. All rights reserved.
//

#import "DSLinkedList.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DSLinkedList *linkedList = [[DSLinkedList alloc]init];
    [linkedList insertObject:@"a"];
    [linkedList insertObject:@"b"];
    [linkedList insertObject:@"c"];
    
    
    NSLog(@"Object At Index 0 : %@",[linkedList objectAtIndex:0]);
    NSLog(@"Object At Index 1 : %@",[linkedList objectAtIndex:1]);
    NSLog(@"Object At Index 2 : %@",[linkedList objectAtIndex:2]);
    NSLog(@"Object At Index 3 : %@",[linkedList objectAtIndex:3]);

    NSLog(@"Index Of Object : %d",[linkedList indexOfObject:@"a"]);
    NSLog(@"Index Of Object : %d",[linkedList indexOfObject:@"b"]);
    NSLog(@"Index Of Object : %d",[linkedList indexOfObject:@"c"]);
    NSLog(@"Index Of Object : %d",[linkedList indexOfObject:@"d"]);

    [linkedList insertObject:@"x" atIndex:0];
    [linkedList insertObject:@"y" atIndex:1];
    [linkedList insertObject:@"z" atIndex:2];
    [linkedList insertObject:@"N" atIndex:4];

    
    NSLog(@"First Object : %@",[linkedList FirstObject]);
    NSLog(@"Last Object : %@",[linkedList LastObject]);
    
    NSLog(@"Total Count : %d",[linkedList Count]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
