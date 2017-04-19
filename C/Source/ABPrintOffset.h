//
//  ABPrintOffset.h
//  HW 1
//
//  Created by Andrew Boychuk on 18.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#ifndef ABPrintOffset_h
#define ABPrintOffset_h

#include <stdio.h>
#include <stddef.h>

#include "ABStructure.h"

void ABPrintOffset();

#define ABPrintOffsetMacro(structName, structMember)\
    printf("position of "#structMember" = %lu\n",offsetof(structName, structMember));

#endif /* ABPrintOffset_h */
