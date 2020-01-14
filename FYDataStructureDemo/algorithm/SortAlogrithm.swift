//
//  SortAlogrithm.swift
//  FYDataStructureDemo
//  排序算法
//  Created by admin on 2019/12/16.
//  Copyright © 2019 fengyangcao. All rights reserved.
//

import UIKit


/// 排序算法
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
    
    
    /// 冒泡排序
    /// - Parameter array:
    @discardableResult
    class func bubblingSort(array: [Int]) -> [Int] {
        var res = array
        print("\n冒泡排序----BEGIN")
        print("排序前数组: \(array)")
        //冒泡次数
        for i in 0 ..< res.count {
            print("第一次冒泡开启: \(res)")
            let j = i + 1
            //每次冒泡将最大的或最小的像右移动
            for j in 0 ..< res.count - j {
                //查找剩余元素的最大/最小值
                if res[j] > res[j+1] {
                    //正序
                    res.swapAt(j, j+1)
                }
            }
            print("第一次冒泡结束: \(res)")
        }
        print("排序后数组: \(res)")
        print("冒泡排序----END")
        return res;
    }
    
    /// 快速排序 O(nlongN)
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
    
    ///插入排序
    @discardableResult
    class func insertSort(array: [Int]) -> [Int] {
        print("\n插入排序----BEGIN")
        print("排序前数组: \(array)")
        var res = array
        if array.count <= 1 {
            return array
        }
        for index in 1 ..< res.count {
            //将当前元素插入到有序数组的前端
            var sortedIndex = index
            while sortedIndex > 0 && res[sortedIndex] > res[sortedIndex-1] {
                res.swapAt(sortedIndex, sortedIndex-1)
                sortedIndex -= 1
                print("交换后的数组: \(res)")
            }
        }
        print("排序后数组: \(res)")        
        return res;
    }
    
    
    /// 插入排序
    /// - Parameter array
    @discardableResult
    class func insertSort2(array: [Int]) -> [Int] {
        print("\n插入排序----BEGIN")
        print("排序前数组: \(array)")
        var res = array
        if array.count <= 1 {
            return array
        }
        //插入字数
        for i in 1 ..< res.count {
            let inserItem = res[i]
            var insert = 0;//插入的位置
            //将当前元素插入到数组的有序部分
            for j in (0 ..< i-1).reversed() {
                //将小值插入到前面 正序排列
                if res[j] < inserItem {
                    insert = j
                    break
                }else {
                    //移动元素
                    res[j+1] = res[j]
                }
            }
            //当前插入的位置为j+1
            res[insert+1] = inserItem
        }
        print("排序后数组: \(res)")
        return res
    }
    
    
    
    /// 希尔排序
    /// - Parameter array: 交换法
    /// 1 确定增量gap: length/2、length/3
    /// 2 逐步缩小增量直至gap = 1
    /// 3 对增量数组进行插入排序
    @discardableResult
    class func shellSort1(array: [Int]) -> [Int] {
        print("\n希尔排序----BEGIN")
        print("排序前数组: \(array)")
        var res = array
        var gap = array.count/2
        print("起始增量gap: \(gap)")
        while gap > 0 {
            //3 对增量数组进行插排(0..gap)
            // 0 0+gap 0+gap*2 0+gap*3
            // 1 1+gap 1+gap*2 1+gap*3
            for i in gap ..< res.count {
                var pre = i - gap
                print("当前分组索引: \(i) 值：\(res[i])")
                while pre >= 0 && res[pre] > res[pre+gap] {
                    print("插入排序交换前的数组: \(res)")
                    print("交换:位置\(pre)=\(res[pre])和位置\(pre+gap)=\(res[pre+gap])")
                    res.swapAt(pre, pre+gap)
                    pre -= gap
                    print("插入排序交换后的数组: \(res)")
                }
            }
            print("gap分组插入排序的数组: \(res)")
            //2 缩小增量
            gap = gap/2
            print("缩小后的增量gap: \(gap)")
        }
        print("排序后数组: \(res)")
        return res
    }
    
    
    
    /// 希尔排序
    /// - Parameter array: 移动法
    @discardableResult
    class func shellSort2(array: [Int]) -> [Int] {
        print("\n希尔排序----BEGIN")
        print("排序前数组: \(array)")
        var res = array
        var gap = array.count/2
        print("起始增量gap: \(gap)")
        while gap > 0 {
            for i in gap ..< res.count {
                let current = res[i]
                var pre = i - gap
                print("当前分组索引: \(i) 值：\(res[i])")
                while pre >= 0 && res[pre] > current {
                    print("插入排序交换前的数组: \(res)")
                    print("交换:位置\(pre)=\(res[pre])和位置\(pre+gap)=\(res[pre+gap])")
                    //移动到下一位置 为插入的元素空出位置
                    res[pre+gap] = res[pre]
                    //继续向前比较
                    pre = pre - gap
                    print("插入排序交换后的数组: \(res)")
                }
                //将current 插入到j的下一个位置
                res[pre+gap] = current
            }
            print("gap分组插入排序的数组: \(res)")
            gap = gap/2
            print("缩小后的增量gap: \(gap)")
        }
        print("排序后数组: \(res)")
        return res
    }
    
    
    
    /// 归并排序
    /// - Parameter array:
    /// 1. 拆分
    /// 2. 合并
    @discardableResult
    class func mergeSort(array: [Int]) -> [Int] {
        print("\n归并排序----BEGIN")
        print("排序前数组: \(array)")
        let res = mergeSort2(array: array, start: 0, end: array.count-1)
        print("排序后数组: \(res)")
        return res
    }
    
    /// 归并排序
    /// - Parameters:
    ///   - array: 需要进行排序的数组
    ///   - start: 开始位置
    ///   - end: 结束位置
    class func mergeSort2(array: [Int], start: Int, end: Int) -> [Int] {
        if start == end {
            return [array[start]]
        }
        
        let mid = (start+end)/2
        //左边需要merge的数组
        let leftArray = mergeSort2(array: array, start: start, end: mid)
        //右边需要merge的数组
        let rightArray = mergeSort2(array: array, start: mid+1, end: end)
        
        print("合并前left: \(leftArray) right:\(rightArray)")
        //合并
        let res = merge(leftArray: leftArray, rightArray: rightArray)
        print("合并后数组: \(res)")
        return res
    }
    
    class func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
        let totalCount = leftArray.count + rightArray.count
        //left 用于标记左边移动的指针
        var left = 0
        //right 用于标记右边移动的指针
        var right = 0
        var tmp = leftArray + rightArray
        for i in 0 ..< totalCount {
            if left >= leftArray.count {
                //左边数组元素已全部排序完成
                tmp[i] = rightArray[right]
                right += 1
            }else if right >= rightArray.count {
                //右边数组元素已全部排序完成
                tmp[i] = leftArray[left]
                left += 1
            }else if leftArray[left] < rightArray[right] {
                //左侧当前指针元素小于右侧当前指针元素
                //按正序排列
                tmp[i] = leftArray[left]
                left += 1
            }else {
                tmp[i] = rightArray[right]
                right += 1
            }
        }
        return tmp
    }
    
    
    
    /// 堆排序 大根堆 正序 小根堆 倒序
    /// - Parameter array:
    class func heapSort(array: [Int]) -> [Int] {
        //构造大顶堆
        let maxHeap = MaxHeap(array: array)
        return maxHeap.sort()
    }
}
