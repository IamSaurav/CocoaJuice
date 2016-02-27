//
//  CJNode.h
//  DataStructure
//
//  Created by Saurav Satpathy on 18/01/16.
//  Copyright © 2016 Saurav Satpathy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJNode : NSObject
@property(nonatomic,strong)CJNode *next;
@property(nonatomic,strong)id value;

-(instancetype)initWithValue :(id)Value Next:(CJNode*)Next;
@end
