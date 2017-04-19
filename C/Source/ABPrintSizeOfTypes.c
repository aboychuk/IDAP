//
//  ABPrintSizeOfTypes.c
//  HW 1
//
//  Created by Andrew Boychuk on 18.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//
//  Вывести размер типов через sizeof.

#include "ABPrintSizeOfTypes.h"

void ABPrintSizeOfTypes() {
    char charVar = 25;
    short shortVar = 334;
    int intVar= 3445;
    long longVar = 7866;
    long long longLongVar = 55443;
    float floatVar = 2144;
    double doubleVar = 5444;
    long double longDoubleVar = 9088;
    printf("char: %lu\n", sizeof(charVar));
    printf("short: %lu\n", sizeof(shortVar));
    printf("int: %lu\n", sizeof(intVar));
    printf("float: %lu\n", sizeof(floatVar));
    printf("long: %lu\n", sizeof(longVar));
    printf("double: %lu\n", sizeof(doubleVar));
    printf("longlong: %lu\n", sizeof(longLongVar));
    printf("longDouble: %lu\n", sizeof(longDoubleVar));
}
