//
//  ABThreadUnsafeObject.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/13/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABThreadUnsafeObject : NSObject
@property (nonatomic, retain)   id  value;

@end
