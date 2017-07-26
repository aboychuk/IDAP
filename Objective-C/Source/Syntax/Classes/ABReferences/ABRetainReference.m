//
//  ABRetainReference.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/31/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABRetainReference.h"

@interface ABRetainReference ()
@property (nonatomic, retain)   id  target;

@end

@implementation ABRetainReference

@synthesize target = _target;

@end
