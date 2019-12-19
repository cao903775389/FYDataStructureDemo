//
//  FYDataStructure.swift
//  FYDataStructureDemo
//
//  Created by admin on 2019/11/11.
//  Copyright © 2019 fengyangcao. All rights reserved.
//

import Foundation
import UIKit

/// MARK - 数据基本概念
/// 数据
/// ^
/// 数据对象（性质相同的数据元素的集合）
/// ^
/// 数据元素
/// ^
/// 数据项


/// MARK - 数据结构划分
/// 逻辑结构
/// 1.集合结构  2. 线性结构  3.树形结构  4.图形结构
///
/// 物理结构
/// 1.顺序存储结构  2.链式存储结构


/// MARK -  抽象数据类型 ADT
/// 1. 原子类型 :  整型、实型、字符型
/// 2. 结构类型 : 数组、结构体

/// MARK - 线性表

protocol FYADTLinerListOpeartion {
    
}

enum FYADTStatus: Int {
    case Success = 1
    case Failed  = 0
}

struct FYADTLinerList<Element> {
    
    var data: [Element] = []
    var length: Int = 0
    
    /// MARK - Operation
    /// 初始化线性表
    init() {
        
    }
    
    /// 判断线性表是否为空
    func ListEmpty() -> Bool {
        return length == 0
    }
    
    ///清空线性表
    func ClearList() {
    }
    
    ///获取线性表某一元素
    func GetElem(location: Int) -> Element {
        return 0 as! Element
    }
    
    ///查询线性表中某一元素的位置
    func LocateElem(ele: Element) -> Int {
        
        return 0
    }
    
    ///插入
    func ListInsert(location: Int, ele: Element) -> Bool {
        
        return true
    }
    
    ///删除
    func ListDelete(location: Int, ele: Element) -> Bool {
        
        return true
    }
    
    ///表长
    func ListLength() -> Int {
        
        return 2
    }
}
