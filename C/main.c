//
//  main.c
//  C
//
//  Created by Andrew Boychuk on 19.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#include <stdio.h>

#include "ABPrintSizeOfTypes.h"
#include "ABMamaPapa.h"
#include "ABPrintMacroValue.h"
#include "ABPrintOffset.h"
#include "ABPrintSizeOfStructure.h"
#include "ABPrintBits.h"
#include "ABDynamicArray.h"

ABPrintMacroValue(short, %d);
const short value = 5;

int main(int argc, const char * argv[]) {
    //mamapapa
    for (int i = 0; i < 1000; ++i) {
        ABMamaPapa(i);
    }
    
    ABCallPrintMacroValue(short, value);
    ABPrintSizeOfTypes();
    ABPrintOffset();
    ABPrintSizeOfStructure();
    ABPrintBits(150);
    //dynamic array
    int elementsArray[5] = {10, 11, 12, 13, 15};
    ABDynamicArray dynamicArray = createStruct(1);
    
    for ( int i = 0; i < 5; ++i) {
        appendElement(&dynamicArray, elementsArray[i]);
    }
    
    printStruct(&dynamicArray);
    deleteElement(&dynamicArray, 0);
    printStruct(&dynamicArray);
    deleteElement(&dynamicArray, 2);
    printStruct(&dynamicArray);
    deleteStruct(&dynamicArray);
    printStruct(&dynamicArray);
    
    printf("Size of structure= %lu\n", sizeof(typesWithBitField));
    
    
    return 0;
}

