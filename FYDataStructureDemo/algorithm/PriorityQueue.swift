//
//  PriorityQueue.swift
//  FYDataStructureDemo
//  优先队列
//  Created by admin on 2020/1/14.
//  Copyright © 2020 fengyangcao. All rights reserved.
//

import Foundation

class PriorityQueue: NSObject {
    
    var maxHeap: MaxHeap = MaxHeap(array: [])
    
    func enqueue(node: Int) {
        maxHeap.insert(node: node)
    }
    
    func dequeue() -> Int? {
        return maxHeap.remove()
    }
}
