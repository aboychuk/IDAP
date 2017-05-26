//
//  ABSyntaxProtocol.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 24.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ABSyntaxProtocol <NSObject>
- (void)sayHiFromProtocol;

@required
- (void)sayHiFromRequiredProtocol;

@optional
- (void)sayHiFromOptionalProtocol;

@end

