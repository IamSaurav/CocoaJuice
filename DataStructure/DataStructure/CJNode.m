//
//  CJNode.m
//  DataStructure
//
//  Created by Saurav Satpathy on 18/01/16.
//  Copyright © 2016 Saurav Satpathy. All rights reserved.
//

#import "CJNode.h"

@implementation CJNode
@synthesize value,prev;

-(instancetype)initWithValue :(id)Value Previous:(CJNode *)previous
{
    self = [super init];
    if (self!=nil) {
        self.value = Value;
        self.prev = previous;
    }
    
    return self;
}
@end
