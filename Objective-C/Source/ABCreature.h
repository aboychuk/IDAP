//
//  ABCreature.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 20.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//
/*
 Условие:
 При родах существо не добавляет к себе ребенка автоматом. Существо умеет говорить "Привет!", причем, когда существо говорит привет, то сначала говорит оно, а потом все его дети (значит и дети детей, и т.д.).
 Задание:
 2. Создать несколько существ и положить их в массив, каждому из существ добавить детей;
 3. В цикле пройти по массиву существ и проверить их пол. Если мужик, то надо отправить существо воевать, если баба, то рожать детей;
 4. У существа наружу должен быть немутабельный массив детей через динамическое проперти с копи+авторелиз, а внутри - еще и мутабельное свойство.
 */

#import <Foundation/Foundation.h>

@interface ABCreature : NSObject
typedef enum {Male, Female} ABCreatureGender;

@property(nonatomic, assign)            ABCreatureGender      gender;
@property(nonatomic, retain)            NSString              *name;
@property(nonatomic, assign)            double                weight;
@property(nonatomic, assign)            NSUInteger            age;
@property(nonatomic, copy, readonly)    NSArray               *childrens;

- (void)goToWar;
- (void)addChild:(ABCreature *)child;
- (void)deleteChild:(ABCreature *)child;
- (void)sayHello;
- (ABCreature *)childBirth;

@end
