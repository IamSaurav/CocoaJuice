//
//  CJStack.h
//  DataStructure
//
//  Created by Saurav Satpathy on 18/01/16.
//  Copyright © 2016 Saurav Satpathy. All rights reserved.
//

#import "CJNode.h"
#import <Foundation/Foundation.h>

@interface CJStack : NSObject

-(void)push :(id)value;
-(id)pop;
-(BOOL)isEmpty;
-(int)count;
-(NSArray*)toArray;
-(NSArray*)reverseStack;

@end
