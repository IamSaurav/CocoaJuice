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

-(instancetype)initWithObject :(id)Value :(CJNode*)Prev
{
    self = [super init];
    if (self!=nil) {
        self.value = Value;
        self.prev = Prev;
    }
    
    return self;
}
@end
