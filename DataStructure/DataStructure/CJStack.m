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
@end

@implementation CJStack
@synthesize top,count,lastObject;

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
    top = [[CJNode alloc] initWithObject:value :top];
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



@end
