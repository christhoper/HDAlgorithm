//
//  递归.swift
//  HDAlgorithm
//
//  Created by bailun on 2023/2/20.
//

import Foundation

// MARK: - 递归
class Recursion {
    
    static func recursion(listNode: ListNode) -> ListNode {
        
        reverse(head: listNode.head!)
        
        return listNode
        
    }
    
    private static func reverse(head: Node) -> Node? {
        
        if head == nil || head.next == nil {
            return head
        }
        
        let lastNode = reverse(head: head.next!)
        head.next?.next = head
        head.next = nil
        return lastNode
    }
    
}
