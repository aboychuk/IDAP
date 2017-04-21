//
//  ABArrayStruct.c
//  IDAPCourse
//
//  Created by Andrew Boychuk on 21.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#include "ABArrayStruct.h"

ABArrayStruct createStruct(unsigned int initialCapacity) {
    ABArrayStruct structure;
    structure.array = malloc(initialCapacity* sizeof(int));
    structure.length = 0;
    structure.capacity = initialCapacity;
    
    return structure;
}

void deleteStruct(ABArrayStruct* structure) {
    if(structure) {
        free(structure->array);
        structure->capacity = 0;
        structure->length = 0;
        structure->array = 0;
    }
}

void addElement(ABArrayStruct* structure, int element) {
    if (structure -> length >= structure -> capacity) {
        structure -> array = realloc(structure -> array, sizeof(int) * (structure -> capacity + 1));
        ++structure -> capacity;
    }
    structure -> array[structure -> length] = element;
    ++structure -> length;
}

void deleteElement(ABArrayStruct* structure, unsigned int index) {
    if(index < structure -> length) {
        printf("Element [ %d ] = %d was deleted\n", index, structure -> array[index]);
        for(int iVar = index; iVar < structure -> length - 1; iVar++) {
            structure -> array[iVar] = structure -> array[iVar+1];
        }
        --structure -> length;
    }
}

void printStruct(ABArrayStruct* structure) {
    printf("Capacity = %d\n",structure -> capacity);
    printf("Length = %d\n",structure -> length);
    for (int index = 0; index < structure -> length; index++) {
        printf("Struct element [ %d ] = %d\n", index, structure -> array[index]);
    }
}
void ABArrayStructTest() {
    int arrayOfElements[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    ABArrayStruct array = createStruct(1);
    for ( int index = 0; index < 10; index++) {
        addElement(&array, arrayOfElements[index]);
    }

    printStruct(&array);
    deleteElement(&array, 9);
    addElement(&array, 9);
    printStruct(&array);
    deleteStruct(&array);
    printStruct(&array);
}
