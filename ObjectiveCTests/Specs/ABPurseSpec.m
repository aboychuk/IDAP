//
//  ABPurseSpec.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/31/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "Kiwi.h"

#import "ABPurse.h"
#import "ABPurseObserver.h"

SPEC_BEGIN(ABPurseSpec)

describe(@"ABPurseSpec", ^{
    __block ABPurse *purse = nil;
    
    beforeAll(^{
        purse = [ABPurse new];
    });
    
    context(@"when observing purse with ABPurseObserver", ^{
        __block ABPurseObserver *observer = nil;
        
        beforeAll(^{
            observer = [ABPurseObserver new];
            observer.purse = purse;
        });
        
        context(@"ABPurseObserver", ^{
            it(@"should receive -purseDidBecomeNonEmpty: when purse.money was 0, became 1", ^{
                purse.money = 0;
                [[observer should] receive:@selector(purseDidBecomeNonEmpty:)];
                purse.money = 1;
            });
            
            it(@"should receive -purseDidBecomeEmpty: when purse.money was 1, became 0", ^{
                purse.money = 1;
                [[observer should] receive:@selector(purseDidBecomeEmpty:)];
                purse.money = 0;
            });
            
            it(@"shouldn't receive -purseDidBecomeEmpty: when purse.money was 0, became 0", ^{
                purse.money = 0;
                [[observer shouldNot] receive:@selector(purseDidBecomeEmpty:)];
                purse.money = 0;
            });
            
            it(@"shouldn't receive -purseDidBecomeNonEmpty: when purse.money was 1, became 1", ^{
                purse.money = 1;
                [[observer shouldNot] receive:@selector(purseDidBecomeNonEmpty:)];
                purse.money = 1;
            });
        });
    });
});

SPEC_END
