//
//  ABStructure.h
//  HW 1
//
//  Created by Andrew Boychuk on 18.04.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//
/*
 Создать структуру, данных, хранящую в себе расположенные в случайном порядке 6 bool, 1 float,       1 int, 1 long long, 3 short, 1 double, 1 указатель на строку.
 Требования:
 создать тестовый метод, который бы с помощью offsetof выводил расположение каждого из элементов;
 создать тестовый метод, который бы выводил размер всей структуры;
 перекомпоновать структуру так, чтобы она занимала наименьшее количество места;
 поместить bool значения в битовое поле и создать union;
 */
#ifndef ABStructure_h
#define ABStructure_h

#include <stdio.h>
#include <stdbool.h>

typedef struct {
    double doubleValue;         //8
    long long longlongValue;    //8
    float floatValue;           //4
    int intValue;               //4
    short shortValue0;          //2
    short shortValue1;          //2
    short shortValue2;          //2
    bool boolValue0;            //1
    bool boolValue1;            //1
    bool boolValue2;            //1
    bool boolValue3;            //1
    bool boolValue4;            //1
    bool boolValue5;            //1
    char *charValue;
} differentTypes;

typedef struct {
    double doubleValue;
    long long longlongValue;
    float floatValue;
    int intValue;
    short shortValue0;
    short shortValue1;
    short shortValue2;
    char *charValue;
    union {
        struct {
            bool boolValue0 : 1;
            bool boolValue1 : 1;
            bool boolValue2 : 1;
            bool boolValue3 : 1;
            bool boolValue4 : 1;
            bool boolValue5 : 1;
        };
        unsigned char Field;
    } bit;
} typesWithBitField;

#endif /* ABStructure_h */
