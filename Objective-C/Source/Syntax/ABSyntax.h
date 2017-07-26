//
//  ABSyntax.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 24.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const ABOutputDelimiter = @"\n--------------------------------------------------------------\n";

@class ABSyntax;

@protocol ABSyntaxProtocol;

@interface ABSyntax : NSObject <NSObject> {    //@interface Определяет интерфейс класса; ABSyntax Название класса; : NSObject От кого наследуемся; <NSObject> - класс отвечает протоколу NSObject; протокол публичный интерфейс без реализации;

    @public
    id<ABSyntaxProtocol> _publicObject;    // можно получить доступ снаружи
    
    @private
    NSObject * _privateObject;    // доступ у объекта

    @protected
    NSObject * _protectedObject;    // доступ у класса и всех его наследников

}

@property (nonatomic, retain)                                                  id<ABSyntaxProtocol> object;
@property (atomic, copy)                                                       NSObject             *atomicCopyObject;
@property (nonatomic, readonly)                                                NSUInteger           integerValue;
@property (nonatomic, assign, readwrite, getter=isReady, setter=setIsReady:)   BOOL                 ready;
@property (nonatomic, readonly)                                                NSArray              *array;

- (void)setIsReady:(BOOL)ready;
- (BOOL)isReady;

+ (instancetype)syntax;
- (void)sayHi;          //- (void) тип возвращаемого значения; sayHi название метода
- (NSString *)text;
- (void)sayWithString:(NSString *)string;       //sayWithString: селектор; :(NSString *) тип принимаемого параметра; string имя параметра;
- (void)sayWithString:(NSString *)string name:(NSString *)name;     //:(NSString *)string 1-й принимаемый параметр; name:(NSString *)name 2-й принимаемый параметр; @selector(sayWithString:name:)
- (void)overloadedPrint;
- (void)print;

@end













