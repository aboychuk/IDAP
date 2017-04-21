//
//  ABMacro.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 21.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//
/*
 1. Создать макрос, который бы генерировал метод для вывода в консоль значения любого примитивного типа. У макроса должно быть 2 параметра: тип, спецификатор вывода. При препроцессинге макрос должен создавать метод output_type, где вместо type должен быть подставлен тип, который мы выводим данным сгенерированным методом. Создать второй макрос, который бы занимался вызовом сгенерированного первым макросом метода, на вход должен получать тип метода.
 Требования:
 - создать тестовые методы для проверки того, как работает генерация на всех примитивных типах.
 */

#ifndef ABMacro_h
#define ABMacro_h

#define ABMacroPrintType(type, formatter)\
    void ABOutput_##type(type parameter) {\
        printf("Parameter = "#formatter"\n",parameter);\
        }

#define ABCallMacroPrintType(type, parameter) \
    ABOutput_##type(parameter)\

#define ABMacroPrintOffset(name, value)\
    printf(#value" = %lu\n",offsetof(name, value));


#endif /* ABMacro_h */
