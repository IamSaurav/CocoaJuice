//
//  ViewController.m
//  DataStructure
//
//  Created by Saurav Satpathy on 18/01/16.
//  Copyright © 2016 Saurav Satpathy. All rights reserved.
//



#import "CJQueue.h"
#import "CJStack.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self testStack];
    //[self testQueue];
//    [self printSolution:114];
    
}

-(void)printSolution: (int)num
{
    for(int i=1;i<=num;i++)
    {
        bool isDivisibleBy3 = i%3==0;
        bool isDivisibleBy5 = i%5==0;
        bool isDivisibleBy7 = i%7==0;
        NSString*word = @"";
        if(isDivisibleBy3)
        {
          word = @"Fizz";
        }
        if(isDivisibleBy5)
        {
            word= [word stringByAppendingString:@"Buzz"];
        }
        if(isDivisibleBy7)
        {
            word= [word stringByAppendingString:@"Woof"];
        }
        if(word.length==0)
        {
            NSLog(@"%d \n",i);
        }
        else
        {
            NSLog(@"%@ \n",word);
        }
        
    }
}

-(void)testQueue
{
    CJQueue *queue = [[CJQueue alloc]init];
    
    [queue enque:@"One"];
    [queue enque:@"Two"];
    [queue enque:@"Three"];
    [queue enque:@"Four"];
    
    //Convert to Array
    NSLog(@"Queue To Array : \n");
    NSArray *array = [queue toArray];
    for (int i=0; i<array.count; i++) {
        NSLog(@"%@\n",[array objectAtIndex:i]);
    }
   
    
    
}

-(void)testStack
{
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
