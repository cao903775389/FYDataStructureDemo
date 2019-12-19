//
//  SortAlogrithm.swift
//  FYDataStructureDemo
//  排序算法
//  Created by admin on 2019/12/16.
//  Copyright © 2019 fengyangcao. All rights reserved.
//

import UIKit


/// <#Description#>
class SortAlogrithm: NSObject {

    
    /// 选择排序 O(n^2)
    /// - Parameter arrary: 无序数组
    private class func findSmallest(array: [Int]) -> Int {
        if array.count == 0 { return NSNotFound }
        var smallest_index = 0
        for item in array.enumerated() {
            if array[smallest_index] < item.element {
                smallest_index = item.offset
            }
        }
        return smallest_index
    }
    
    @discardableResult
    class func selectionSort(array:[Int]) -> [Int] {
        var resArray:[Int] = []
        print(" \n选择排序----BEGIN")
        print("排序前数组: \(array)")
        var sortArray = array
        if array.count <= 1 { return sortArray }
        for _ in 0 ..< sortArray.count {
            let smallest_index = findSmallest(array: sortArray)
            if smallest_index != NSNotFound {
                print("找到最小值: index = \(smallest_index) value = \(sortArray[smallest_index])")
                resArray.append(sortArray[smallest_index])
                sortArray.remove(at: smallest_index)
            }
        }
        print("排序后数组: \(resArray)")
        print("选择排序----END")
        return resArray;
    }
    
    
    /// 快速排序 O(longN)
    /// - Parameter array: 无序数组
    @discardableResult
    class func quickSort(array: [Int]) -> [Int] {
        print("\n快速排序----BEGIN")
        print("排序前数组: \(array)")
        if array.count < 2 {
            print("排序后数组: \(array)")
            print("快速排序----END")
            return array
        }
        //基准值
        let provi = array[0]
        //比基准值小的数组
        var less:[Int] = []
        //比基准值大的数组
        var greater:[Int] = []
        for index in 1 ..< array.count {
            if array[index] <= provi {
                less.append(array[index])
            }else {
                greater.append(array[index])
            }
        }
        print("less数组: \(less)")
        print("greater数组: \(greater)")
        let res = quickSort(array: less) + [provi] + quickSort(array: greater)
        print("排序后数组: \(res)")
        return res
    }
}
