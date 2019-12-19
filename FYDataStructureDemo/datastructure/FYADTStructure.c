//
//  FYADTStructure.c
//  FYDataStructureDemo
//
//  Created by admin on 2019/11/15.
//  Copyright © 2019 fengyangcao. All rights reserved.
//

#include "FYADTStructure.h"

#define MAXSIZE 20
#define ERROR 0
#define OK  1

//线性表顺序结构
typedef int FYADTElementType;
typedef struct {
    FYADTElementType *data;
    int length;
    int listSize;
}FYADTSeqList;

///Operation
int InitADTSeqList(FYADTSeqList *L) {
    L->data = (FYADTElementType *)malloc(MAXSIZE * sizeof(FYADTElementType *));
//    for (int i = 0; i < MAXSIZE; i++) {
//        L->data[i] = i + 1;
//    }
    if (L->data == NULL) {
        return ERROR;
    }
    L->length = 0;
    L->listSize = MAXSIZE;
    return OK;
}

int ListEmpty(FYADTSeqList *L) {
    return L->length == 0;
}

///查找元素(i为第i个元素)
int GetElement(FYADTSeqList *L, int i, FYADTElementType *element) {
    if (L->length == 0 || i < 1 || i > L->length) {
        return ERROR;
    }
    *element = L->data[i-1];
    return OK;
}

///插入元素
int InsertElement(FYADTSeqList *L, int i, FYADTElementType *element) {
    if (L->length == MAXSIZE) {
        printf("线性表已满");
        return ERROR;
    }else if (i < 0 || i > L->length+1) {
        printf("cha");
        return ERROR;
    }
    
    return OK;
}

void testCase() {
    
    //初始化
    FYADTSeqList list;
    int res = InitADTSeqList(&list);
    printf("初始化顺序表：%d \n", res);
    
    //查询
    FYADTElementType ele1;
    int index = 10;
    GetElement(&list, index, &ele1);
    printf("查询元素%d = %d \n", index, ele1);
    
    //
    
}
