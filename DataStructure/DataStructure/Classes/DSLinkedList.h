//
//  DSLinkedList.h
//  DataStructure
//
//  Created by Saurav Satpathy on 24/10/15.
//  Copyright © 2015 Saurav Satpathy. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DSLinkedList : NSObject

-(void)insertObject:(id)anObject atIndex:(int)index;
-(int)indexOfObject :(id)object;
-(id)objectAtIndex:(int)index;
-(void)insertObject:(id)anObject;
-(id)LastObject;
-(id)FirstObject;
-(int)Count;

@end
