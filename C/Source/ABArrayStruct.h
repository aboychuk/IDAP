//
//  ABArrayStruct.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 21.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//
/*
 Создать структуру типа массив, которая бы реализовывала следующие требования:
 1. Структура должна владеть указателем на массив элементов.
 2. Должен существовать метод создания структуры на куче.
 3. Должен существовать метод деаллокации структуры на куче.
 4. Массив должен создаваться с произвольным начальным количеством места под элементы.
 5. Элементом может быть сущность произвольного размера в байтах.
 6. Массив должен поддерживать расширение, сужение занимаемого в памяти места в зависимости от количества элементов.
 */

#ifndef ABArrayStruct_h
#define ABArrayStruct_h

#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int *array;
    unsigned int length;
    unsigned int capacity;
} ABArrayStruct;

ABArrayStruct createStruct(unsigned int initialCapacity);
void deleteStruct();
void addElement(ABArrayStruct*, int element);
void deleteElement(ABArrayStruct* array, unsigned int index);
void printStruct(ABArrayStruct* array);
void ABArrayStructTest();


#endif /* ABArrayStruct_h */
