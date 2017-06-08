//
//  ABCopyReference.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/31/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABCopyReference.h"

@interface ABCopyReference ()
@property (nonatomic, readonly)   id  target;

@end

@implementation ABCopyReference

@synthesize target = _target;

@end
