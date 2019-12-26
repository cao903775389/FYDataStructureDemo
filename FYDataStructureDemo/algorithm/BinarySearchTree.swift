//
//  BinarySearchTree.swift
//  FYDataStructureDemo
//
//  Created by admin on 2019/12/26.
//  Copyright © 2019 fengyangcao. All rights reserved.
//

import Foundation

///二叉搜索树
class BinarySearchTree<T: Comparable> {
    
    var value: T
    var parent: BinarySearchTree?
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
    
    //插入节点
    public func insert(value: T) {
        if value < self.value {
            //当前值比根节点小
            if let left = self.left {
                //存在左子树
                left.insert(value: value)
            }else {
                //左子树不存在 直接插入
                left = BinarySearchTree(value: value)
                left?.parent = self;
            }
        }else {
            //当前值比根节点大
            if let right = self.right {
                //存在右子树
                right.insert(value: value)
            }else {
                //右子树不存在 直接插入
                right = BinarySearchTree(value: value)
                right?.parent = self;
            }
        }
    }
    
    //删除节点
    //case1 当前节点的left tree最大的node
    //case2 当前节点的right tree最小的note
    @discardableResult
    public func remove() -> BinarySearchTree? {
        var replaceNode: BinarySearchTree?
        if let left = left {
            //找到左子树最大值的node
            replaceNode = left.maximum()
        }else if let right = right {
            //找到右子树最小的
            replaceNode = right.minimum()
        }else {
            replaceNode = nil
        }
        
        //移除将要移动的节点
        replaceNode?.remove()
        
        //将替换的节点移动到当前需要删除的节点位置
        replaceNode?.left = left
        replaceNode?.right = right
        left?.parent = replaceNode
        right?.parent = replaceNode
        
        //将当前节点parent节点的字节点修改为要替换的
        if let parent = parent {
            if self === parent.left {
                parent.left = replaceNode
            }else if self === parent.right {
                parent.right = replaceNode
            }
        }
        
        //清空当前节点
        parent = nil
        left = nil
        right = nil
        
        return replaceNode
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        if let right = node.right {
            node = right.maximum()
        }
        return node
    }
    
    public func minimum() -> BinarySearchTree {
        var node = self
        if let left = node.left {
            node = left.minimum()
        }
        return node
    }
    
    //遍历二叉搜索树
    //中序遍历
    public func traverseInOrder() {
        left?.traverseInOrder()
        print("中序遍历当前节点的值：\(value)")
        right?.traverseInOrder()
    }
    
    //前序遍历
    public func traversePreOrder() {
        print("前序遍历当前节点的值\(value)")
        left?.traversePreOrder()
        right?.traversePreOrder()
    }
    
    //后序遍历
    public func traversePostOrder() {
        left?.traversePostOrder()
        right?.traversePostOrder()
        print("后序遍历当前节点的值\(value)")
    }
    
    //搜索
    public func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value: value)
        }else if value > self.value {
            return right?.search(value: value)
        }else {
            return self
        }
    }
    
    //返回树的高度(当前节点到最下方的字节点的需要的步数)
    public func height() -> Int {
        if let _ = parent {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }else {
            return 0
        }
    }
    
    //返回树的深度(当前节点到根节点需要的步数)
    public func depth() -> Int {
        var depth = 0
        var node = self
        while let parent = node.parent {
            node = parent
            depth += 1
        }
        return depth
    }
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    var s = ""
    if let left = left {
      s += "(\(left.description)) <- "
    }
    s += "\(value)"
    if let right = right {
      s += " -> (\(right.description))"
    }
    return s
  }
}
