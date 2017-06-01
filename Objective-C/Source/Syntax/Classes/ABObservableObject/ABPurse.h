//
//  ABPurse.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/31/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

@class ABPurse;

typedef NS_ENUM(NSUInteger, ABPurseState) {
    ABPurseEmpty,
    ABPurseNonEmpty
};

@protocol ABPurseObserver <NSObject>

@optional
- (void)purseDidBecomeEmpty:(ABPurse *)purse;
- (void)purseDidBecomeNonEmpty:(ABPurse *)purse;

@end

@interface ABPurse : ABObservableObject
@property (nonatomic, assign)   NSUInteger  money;

@end
