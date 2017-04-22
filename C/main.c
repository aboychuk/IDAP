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
#include "ABMacro.h"
#include "ABPrintOffset.h"
#include "ABPrintSizeOfStructure.h"
#include "ABPrintBits.h"
#include "ABArrayStruct.h"

ABMacroPrintType(short, %d);
const short value = 5;

int main(int argc, const char * argv[]) {
    ABCallMacroPrintType(short, value);
    ABPrintSizeOfTypes();
    ABPrintOffset();
    ABPrintSizeOfStructure();
    ABPrintBits(150);
    ABArrayStructTest();
    for (int i = 0; i < 1000; ++i) {
        ABMamaPapa(i);
    }
    
    return 0;
}

