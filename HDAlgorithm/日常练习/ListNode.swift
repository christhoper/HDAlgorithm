//
//  ListNode.swift
//  HDAlgorithm
//
//  Created by bailun on 2023/2/8.
//

import Foundation

// MARK: - 链表节点
class Node: Equatable {
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value
    }
    
    var next: Node?
    var value: Int
    weak var previous: Node?
    
    init(value: Int) {
        self.value = value
    }
}


// MARK: - 链表
class ListNode {
    
    typealias Element = Node
    
    var head: Element?
    var trail: Element?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Element? {
        return head
    }
    /// 遍历获得最后一个节点
    var last: Element? {
        guard var node = head  else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
}

extension ListNode {
    
    func append(_ value: Int) {
        let newNode = Node(value: value)
        if let last = last {
            newNode.previous = last
            last.next = newNode
        } else {
            head = newNode
        }
    }
}
