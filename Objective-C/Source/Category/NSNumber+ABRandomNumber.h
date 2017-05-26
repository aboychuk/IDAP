//
//  NSNumber+ABRandomNumber.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (ABRandomNumber)

BOOL ABRandomBool();
NSUInteger ABRandomInRange(NSRange range);

@end
