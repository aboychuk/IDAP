//
//  ABPrintMacroValue.h
//  HW 1
//
//  Created by Andrew Boychuk on 18.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//
/*
    Создать макрос, который бы генерировал метод для вывода в консоль значения любого примитивного типа. У макроса должно быть 2 параметра: тип, спецификатор вывода. При препроцессинге макрос должен создавать метод output_type, где вместо type должен быть подставлен тип, который мы выводим данным сгенерированным методом. Создать второй макрос, который бы занимался вызовом сгенерированного первым макросом метода, на вход должен получать тип метода. Требования:
 создать тестовые методы для проверки того, как работает генерация на всех примитивных типах.
 */

#ifndef ABPrintMacroValue_h
#define ABPrintMacroValue_h

#include <stdio.h>

#define ABPrintMacroValue(type, formatter)\
    void ABOutput_##type(type parameter) {\
        printf("Parameter = "#formatter"\n",parameter);\
}

#define ABCallPrintMacroValue(type, parameter) \
    ABOutput_##type(parameter)\

#endif /* ABPrintMacroValue_h */
