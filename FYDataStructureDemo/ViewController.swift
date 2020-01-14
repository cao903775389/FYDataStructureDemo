//
//  ViewController.swift
//  FYDataStructureDemo
//
//  Created by admin on 2019/11/11.
//  Copyright © 2019 fengyangcao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        testCase()
        
        //二分查找
        let array = [1,2,3,4,5,6,7,8,9,10]
        SearchAlogrithm.binarySearch(array: array, target: 2)
        SearchAlogrithm.recurseBinarySearch(array: array, target: 6, range: 0 ..< array.count)
        
        //排序
        SortAlogrithm.selectionSort(array: [5,2,3,4,0,1,9,8])
        SortAlogrithm.quickSort(array: [10,2,5,3,1,0,9,8,5])
        SortAlogrithm.insertSort(array: [3,8,2,1,10,4,5,9])
        SortAlogrithm.insertSort2(array: [3,8,2,1,10,4,5,9])
        SortAlogrithm.bubblingSort(array: [4,1,6,9,0,2,5])
        SortAlogrithm.shellSort1(array: [4,1,6,9,0,2,5])
        SortAlogrithm.shellSort2(array: [4,1,6,9,0,2,5])
        SortAlogrithm.mergeSort(array: [4,1,6,9,0,2,5])
        SortAlogrithm.heapSort(array: [4,1,6,9,0,2,5])
        
        //二叉搜索树
        print("\n二叉搜索树")
        let bst = BinarySearchTree(value: 9)
        
        bst.insert(value: 3)
        bst.insert(value: 6)
        bst.insert(value: 8)
        bst.insert(value: 5)
        bst.insert(value: 10)
        
        //                     9
        //          3                   10
        //              6
        //            5    8
        print(bst)
        
        bst.traverseInOrder()
        print(bst)

        bst.traversePreOrder()
        print(bst)

        bst.traversePostOrder()
        print(bst)
        
        let target = bst.search(value: 5)
        print("当前节点\(target?.description ?? "")")
        print("当前节点的高度\(target?.height() ?? 0)")
        print("当前节点的深度\(target?.depth() ?? 0)")

        
        //大顶堆
        let maxHeap = MaxHeap(array: [2, 7, 1, 5, 1, 8, 0])
        let maxNum = maxHeap.peeK()
        print("当前堆顶元素为\(String(describing: maxNum))")
        maxHeap.insert(node: 8)
    }
}

