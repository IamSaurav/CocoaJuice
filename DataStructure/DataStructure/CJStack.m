//
//  CJStack.m
//  DataStructure
//
//  Created by Saurav Satpathy on 18/01/16.
//  Copyright © 2016 Saurav Satpathy. All rights reserved.
//

#import "CJStack.h"

@interface CJStack()
@property(nonatomic,strong)CJNode*top;
@property(nonatomic,assign)int count;
@end

@implementation CJStack
@synthesize top,count;

- (instancetype)init
{
    self = [super init];
    if (self) {
        top = nil;
        count = 0;
    }
    return self;
}

-(void) push: (id) value {
    top = [[CJNode alloc] initWithValue:value Previous:top];
    count++;
}

-(id)pop
{
    if (count>0) {
        id temp = top.value;
        top = top.prev;
        count--;
        return  temp;
    }
    return [NSNull null];
}

-(int)count
{
    return count;
}

-(BOOL)isEmpty
{
    return count == 0;
}

-(NSArray*)toArray
{
    NSMutableArray *castedArray = [[NSMutableArray alloc]init];
    CJNode *tempObj = top;
    while (tempObj.prev != nil)
    {
        NSLog(@"%@",tempObj.value);
        [castedArray addObject:tempObj.value];
        tempObj = tempObj.prev;
    }
    return castedArray;
}


-(NSArray*)reverseStack
{
    [self reverse:top NextNode:top.prev];
    return [self toArray];
}

-(void)reverse:(CJNode *)topNode NextNode: (CJNode *)nextNode
{
    CJNode *tempObj;
    if (nextNode != nil)
    {
        tempObj = nextNode.prev;
        nextNode.prev = topNode;
        topNode = nextNode;
        nextNode = tempObj;
        top = topNode;
        [self reverse:topNode NextNode:nextNode];
    }
}

-(void)rever : (CJNode*)node
{
    CJNode *temp = top;
    [self push:node];
    [self pop];
}










@end
