//
//  ABDynamicArray.h
//  HW 1
//
//  Created by Andrew Boychuk on 18.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#ifndef ABDynamicArray_h
#define ABDynamicArray_h

#include <stdio.h>

typedef struct {
    int* dynamicArray;
    unsigned int length;
    unsigned int capacity;
}ABDynamicArray;

ABDynamicArray createStruct(unsigned int initialCapacity);
void appendElement(ABDynamicArray*, int element);
void deleteStruct();
void deleteElement(ABDynamicArray* result, unsigned int index);
void printStruct(ABDynamicArray* result);
#endif /* ABDynamicArray_h */
