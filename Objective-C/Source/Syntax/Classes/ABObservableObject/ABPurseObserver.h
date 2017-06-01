//
//  ABPurseObserver.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/31/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABPurse.h"

@interface ABPurseObserver : NSObject <ABPurseObserver>
@property (nonatomic, retain)   ABPurse *purse;

@end
