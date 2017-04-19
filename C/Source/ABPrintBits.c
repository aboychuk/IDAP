//
//  ABPrintBits.c
//  HW 1
//
//  Created by Andrew Boychuk on 18.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#include <stdio.h>

#include "ABPrintBits.h"

void ABPrintBits(int value) {
    printf("Number = %d\n", value);
    int arrayElements[sizeof(value) * 8];
    int index = 0;
    
    while (value != 0) {
        arrayElements[index] = value&1;
        ++index;
        value = value >> 1;
    }
    for(int k = index - 1; k >=0; --k ) {
        printf("%d", arrayElements[k]);
    }
    printf("\n");
}
