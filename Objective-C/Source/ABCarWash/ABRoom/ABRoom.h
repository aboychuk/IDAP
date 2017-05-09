//
//  ABRoom.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 28.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABWorker.h"

@interface ABRoom : NSObject
@property (nonatomic, assign)   NSUInteger  capacity;
@property (nonatomic, copy, readonly)   NSArray *workers;

- (void)addWorker:(ABWorker *)worker;
- (void)removeWorker:(ABWorker *)worker;

@end
