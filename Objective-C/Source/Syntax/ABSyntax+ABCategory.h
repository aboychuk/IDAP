//
//  ABSyntax+ABCategory.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 24.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSyntax.h"

@interface ABSyntax (ABCategory); //расширение класса новым методом, может быть реализована в другом исходнике.

- (void)sayHiFromCategory;

@end
