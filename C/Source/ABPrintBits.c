//
//  ABPrintBits.c
//  HW 1
//
//  Created by Andrew Boychuk on 18.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//   2. Создать метод для вывода битов числа в консоль.

#include <stdio.h>

#include "ABPrintBits.h"

void ABPrintBits(int value)
{
    printf("Number = %lu\n", sizeof(value));
    int index;
    for(index = 8 * sizeof(value) - 1; index >= 0; index--) {
        (value & (1 << index)) ? putchar('1') : putchar('0');
    }
    printf("\n");
}
