//
//  ABDelegate.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABDelegatingObject.h"

@interface ABDelegate : NSObject <ABDelegatingObjectDelegate>
@property(nonatomic, retain)    ABDelegatingObject *delegatingObject;

@end
