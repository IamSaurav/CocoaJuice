//
//  DSNode.h
//  DataStructure
//
//  Created by Saurav Satpathy on 25/10/15.
//  Copyright © 2015 Saurav Satpathy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSNode : NSObject
@property(nonatomic,strong) id Value;
@property(nonatomic,strong) DSNode *PrevNode;
@property(nonatomic,strong) DSNode *NextNode;
@end
