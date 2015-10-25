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
    
    DSNode *node = [[DSNode alloc]init];
    node.Value = anObject;
    
    if (self.FirstObject == nil) {
        self.FirstNode = node;
        self.LastNode = node;
        self.FirstNode.NextNode = nil;
        self.FirstNode.PrevNode = nil;
    }
    else
    {
        self.LastNode.NextNode = node;
        self.LastNode = node;
        self.LastNode.NextNode = nil;
    }
    self.ListCount++;
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

-(id)objectAtIndex:(int)index
{
    DSNode*node = self.FirstNode;
    int a = 0;
    
    do {
        if(node.NextNode ==nil) return nil;
        node = node.NextNode;
        a++;
    } while (a!=index);
    
    return node;
}

@end


