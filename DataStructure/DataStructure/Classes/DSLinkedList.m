//
//  DSLinkedList.m
//  DataStructure
//
//  Created by Saurav Satpathy on 24/10/15.
//  Copyright © 2015 Saurav Satpathy. All rights reserved.
//

#import "DSNode.h"
#import "DSLinkedList.h"

@interface DSLinkedList ()
@property(nonatomic,strong) DSNode* FirstNode;
@property(nonatomic,strong) DSNode* LastNode;
@property(nonatomic,assign) int ListCount;
@end

@implementation DSLinkedList

-(id)init
{
    self = [super init];
    if (self) {
        self.ListCount = 0;
    }
    return self;
}

- (void)insertObject:(id)anObject {
    
    if (anObject == nil) return;
    [self insertObject:anObject atIndex:self.ListCount];
}

- (void)insertObject:(id)anObject atIndex:(int)index
{
    if (anObject == nil) return;
    
    DSNode* prevNode = [self NodeAtIndex:index-1];
    DSNode* nextNode = [self NodeAtIndex:index+1];
    
    DSNode *newNode = [[DSNode alloc]init];
    newNode.Value = anObject;
    
    if (index==0) {
        self.FirstNode = newNode;
        if (self.FirstNode.NextNode==nil) {
            self.FirstNode.NextNode = nextNode;
        }
        self.ListCount++;
    }
    else if(prevNode!=nil)
    {
        prevNode.NextNode = newNode;
        newNode.NextNode = nextNode;
        
        self.ListCount++;
        
        if (nextNode==nil) {
            self.LastNode = newNode;
        }
    }
    
}

-(DSNode*)NodeAtIndex:(int)index
{
    int i = 0;
    for (DSNode *node = self.FirstNode; node != nil; node = node.NextNode,i++)
    {
        if (index == i) {
            return node;
        }
    }
    return nil;
}

-(id)objectAtIndex:(int)index
{
    return [self NodeAtIndex:index].Value;
}

-(int)indexOfObject :(id)object
{
    
    int i = 0;
    for (DSNode *node = self.FirstNode; node != nil; node = node.NextNode,i++)
    {
        if ([node.Value  isEqual: object]) {
            return i;
        }
    }
    return -1;
}




-(id)LastObject
{
    return self.LastNode.Value;
}

-(id)FirstObject
{
    return self.FirstNode.Value;
}

-(int)Count
{
    return self.ListCount;
}

@end


