//
//  NSObject+ABRandomNumber.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 6/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ABRandomNumber)

BOOL ABRandomBool();
NSRange ABMakeRange(NSUInteger firstNumber, NSUInteger lastNumber);
NSUInteger ABRandomValueInRange(NSRange range);
NSUInteger ABRandomWithMaxValue(NSUInteger value);

@end
