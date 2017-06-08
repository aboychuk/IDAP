//
//  ABReference.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/31/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABReference : NSObject <NSCopying>
@property (nonatomic, readonly) id  target;

+ (instancetype)referanceWithTarget:(id)target;

- (instancetype)initWithTarget:(id)target;

- (BOOL)isEqualToReference:(ABReference *)reference;

@end
