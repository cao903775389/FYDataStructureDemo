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
        // Do any additional setup after loading the view.
//        testCase()
        
        //二分查找
        let array = [1,2,3,4,5,6,7,8,9,10]
        SearchAlogrithm.binarySearch(array: array, target: 2)
        SearchAlogrithm.recurseBinarySearch(array: array, target: 6, range: 0 ..< array.count)
        
        //排序
        SortAlogrithm.selectionSort(array: [5,2,3,4,0,1,9,8])
        SortAlogrithm.quickSort(array: [10,2,5,3,1,0,9,8,5])
    }
}

