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
    
    NSLog(@"Object At Index: %@",[linkedList objectAtIndex:2]);
    NSLog(@"Last Object : %@",linkedList.LastObject);
    NSLog(@"First Object : %@",linkedList.FirstObject);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
