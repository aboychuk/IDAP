//
//  NSString+ABRandomString.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/2/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ABRandomString)

//english
+ (instancetype)numericAlphabet;
+ (instancetype)alphanumericAlphabet;
+ (instancetype)lowercaseLetterAlphabet;
+ (instancetype)capitalizedLetterAlphabet;
+ (instancetype)letterAlphabet;
+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;

//returns string with english alphanumeric characters of random length
//of up to 30 with the class of reciever
+ (instancetype)randomString;

//returns string with english alphanumeric characters of length
//with the class of reciever
+ (instancetype)randomStringWithLength:(NSUInteger)length;

//returns string with characters from alphabet of length
//with the class of reciever
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
