//
//  Heap.swift
//  FYDataStructureDemo
//
//  Created by admin on 2020/1/14.
//  Copyright © 2020 fengyangcao. All rights reserved.
//

import UIKit

//满二叉树：除了叶子结点外所有子节点的左右孩子都不为空
//完全二叉树: 如果存在左右孩子为空的情况 那么一定是右孩子为空
//堆是用数组表示的一颗完全二叉树 也叫做优先队列
//堆顶为最大值时，称为“最大堆”，也称大顶堆；
//堆顶为最小值时，称为“最小堆”，也称小顶堆。
//公式：叶节点数量 = floor(总节点个数/2 )
//最后一个非叶节点的索引 = floor（(总节点个数 - 1)/2）
//父节点parent = (i - 1)/2
//leftNode = 2i + 1
//rightNode = 2i + 2
//堆的高度 h = floor(log(n))
//节点总数 T = 2^(h+1) - 1

class MaxHeap : NSObject {
    //所有节点
    var nodes = [Int]()
    
    init(array :[Int]) {
        super.init()
        buildHeap(array: array)
    }
    
    func leftChildIndex(index: Int) -> Int {
        return 2*index + 1
    }
    
    func rightChildIndex(index: Int) -> Int {
        return 2*index + 2
    }
    
    func parentIndex(index: Int) -> Int {
        return (index - 1)/2
    }
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
    
    //获取堆顶元素
    func peeK() -> Int? {
        return nodes.first
    }
    
    //插入元素
    func insert(node: Int) {
        //插入元素到队尾
        print("当前堆插入前：\(nodes)\n")
        nodes.append(node)
        //重新调整堆
        shiftUp(index: nodes.count - 1)
        print("当前堆插入后：\(nodes)\n")
    }
    
    //移除堆顶元素
    func remove() -> Int? {
        if isEmpty() {
            return nil
        }else if nodes.count == 1 {
            return nodes.removeLast()
        }else {
            //将堆底元素和堆顶元素交换
            let node = nodes[0]
            //移除堆底元素
            nodes[0] = nodes.removeLast()
            //下沉堆顶元素 重新调整
            shiftDown(index: 0)
            return node
        }
    }
    
    /// 构造堆
    /// - Parameter nodes: 初始数组
    private func buildHeap(array: [Int]) {
        print("开始构造大顶堆\n")
        print("构造前数组: \(array)\n")
        nodes = array
        if nodes.count <= 1  {
            print("构造后数组: \(nodes)\n")
            return
        }
        let count = nodes.count
        //从最后一个非叶节点开始构造堆
        //最后一个非叶子节点的索引 = count/2 - 1
        for i in stride(from: count/2-1, through: 0, by: -1) {
            //向下调整
            shiftDown(index: i)
        }
        print("构造后数组: \(nodes)\n")
    }
    
    //判断左右子节点和当前节点是否需要交换
    //下沉元素(堆化 用于移除元素)
    func shiftDown(index: Int) {
        shiftDown(index: index, heapSize: nodes.count)
    }
    
    func shiftDown(index: Int, heapSize: Int) {
        print("开始下沉节点: \(index)\n")
        let leftChild = leftChildIndex(index: index)
        let rightChild = rightChildIndex(index: index)
        var presentIndex = index
        if leftChild < heapSize && nodes[leftChild] > nodes[presentIndex] {
            //左节点比当前节点大
            presentIndex = leftChild
            print("左节点大于当前节点leftIndex: \(presentIndex)\n")
        }
        if rightChild < heapSize && nodes[rightChild] > nodes[presentIndex] {
            //右节点比当前节点大
            presentIndex = rightChild
            print("右节点大于当前节点rightIndex: \(presentIndex)\n")
        }
        
        if presentIndex == index {
            //无需交换 当前堆顶元素为最大值
            print("当前节点为最大节点:\(presentIndex) 无需调整")
            return
        }
        print("下沉后最大节点index为:\(presentIndex)")
        nodes.swapAt(index, presentIndex)
        //继续向下调整交换 直到所有节点都满足堆顶元素为最大值
        shiftDown(index: presentIndex, heapSize: heapSize)
    }
    
    //上移元素(用于插入数据)
    func shiftUp(index: Int) {
        print("开始上移节点: \(index)\n")
        let parent = parentIndex(index: index)
        var presentIndex = index
        if parent > 0 && nodes[parent] < nodes[index] {
            //根节点的值比当前节点小 上移当前节点
            presentIndex = parent
            print("根节点小于当前节点parentIndex: \(presentIndex)\n")
        }
        if presentIndex == index {
            print("当前节点小于根节点:\(presentIndex) 无需调整")
            return
        }
        print("上移后最大节点index为:\(presentIndex)")
        nodes.swapAt(index, presentIndex)
        shiftUp(index: presentIndex)
    }
    
    //堆排序
    //stride(from:to:by) 开区间处理，最后一个值严格小于最大值
    //stride(from:through:by)，闭区间处理，最后一个值小于或等于最大值
    func sort() -> [Int] {
        print("堆排序前数组: \(nodes)\n")
        if nodes.count <= 1 {
            print("堆排序后数组: \(nodes)\n")
            return nodes
        }
        for i in stride(from: nodes.count - 1, through: 1, by: -1) {
            nodes.swapAt(0, i)
            shiftDown(index: 0, heapSize: i)
            print("堆顶和堆底元素交换后: \(nodes)\n")
        }
        print("堆排序后数组: \(nodes)\n")
        return nodes
    }
}
