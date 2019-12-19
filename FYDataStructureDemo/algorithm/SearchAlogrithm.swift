//
//  SearchAlogrithm.swift
//  FYDataStructureDemo
//
//  Created by admin on 2019/12/16.
//  Copyright © 2019 fengyangcao. All rights reserved.
//

import UIKit

class SearchAlogrithm: NSObject {

    /// 二分查找 时间复杂度 O(longn)
    /// - Parameters:
    ///   - array: 有序数组(默认升序)
    ///   - target: 查找的数据项
    ///   - return: 返回在数组中的索引
    @discardableResult
    class func binarySearch(array: [Int], target: Int) -> Int? {
        //[letf------Right]
        print("搜索的有序数组: \(array)")
        let count = array.count
        if count == 0 {
            print("数组为空 目标索引不存在")
            return nil;
        }
        var start = 0
        var end = count - 1
        while start <= end {
            let mid:Int = (start+end)/2
            let midData = array[mid]
            if midData == target {
                //got it
                print("目标索引为: \(mid)")
                return mid
            }else if (midData < target) {
                //中间数据比目标要小，移动start位置
                start = mid + 1
                print("中间值比target小 移动start: \(start)")
            }else {
                //中间数据比目标要大，移动end位置
                end = mid - 1
                print("中间值比target大 移动end: \(end)")
            }
        }
        print("未查询到目标为\(target)的索引")
        return nil;
    }
    
    @discardableResult
    //二分查找递归实现
    class func recurseBinarySearch(array: [Int], target: Int, range: Range<Int>) -> Int? {
        //[letf------Right]
        print("搜索的有序数组: \(array)")
        let count = array.count
        if count == 0 {
            print("数组为空 目标索引不存在")
            return nil;
        }
        var start = range.lowerBound
        var end = range.upperBound
        let mid:Int = (start + end)/2
        let midData = array[mid]
        
        if start >= end {
            print("未查询到目标为\(target)的索引")
            return nil;
        }else if (midData < target) {
            //中间数据比目标要小，移动start位置
            start = mid+1
            print("中间值比target小 移动start: \(start)")
            return recurseBinarySearch(array: array, target: target, range: start ..< end)
            
        }else if (midData > target) {
            //中间数据比目标要大，移动end位置
            end = mid
            print("中间值比target大 移动end: \(end)")
            return recurseBinarySearch(array: array, target: target, range: start ..< end)
        }else {
            //got it
            print("目标索引为: \(mid)")
            return mid
        }
    }
}
