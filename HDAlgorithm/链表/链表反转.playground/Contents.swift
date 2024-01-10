import UIKit

var str = "Hello, playground"


class ListNode: Equatable {
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
       return lhs.val == rhs.val
    }
    
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//MARK: -  递归操作链表并不高效。和迭代解法相比，虽然时间复杂度都是 O(N)，但是迭代解法的空间复杂度是 O(1)，而递归解法需要堆栈，空间复杂度是 O(N)。

//MARK: - 递归思想解决链表反转问题
class SolutionA {
    init() {}
    
    /// 反转整个链表
    func reverseListNode(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let lastNode = reverseListNode(head?.next)
        head?.next?.next = head
        head?.next = nil
        return lastNode
    }
    
    /// 反转链表前N个节点
    /// 例子： 1 -> 2 -> 3 -> 4 -> 5 -> NULL  反转N=2前的节点，即节点是3，后驱节点为4，反转之后就变成：3 -> 2 -> 1 -> 4 -> 5 -> NULL
    func reverseListNode(for index: Int, head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        // 记录后驱节点
        var successor: ListNode?
        
        if index == 1 {
            // 记录第n+1个节点
            successor = head.next
            return head
        }
        
        let lastNode = reverseListNode(for: index - 1, head: head.next)
        head.next?.next = head
        // 反转之后的head节点和后面的节点连接起来
        head.next = successor
        return lastNode
    }
    
    /// 反转链表 [start end]区间部分的节点
    /// 例子：1 -> 2 -> 3 -> 4 -> 5 -> NULL ， 区间 [2, 3]（所以从1开始）
    /// 结果：1 -> 3 -> 2 -> 4 -> 5 -> NULL
    func reverseListNode(for start: Int, end: Int, head: ListNode?) -> ListNode? {
        // base case
        if start == 1 {
            return reverseListNode(for: start, end: end, head: head)
        }
        // 前进到反转的起点触发base case
        head?.next = reverseListNode(for: start - 1, end: end - 1, head: head?.next)
        return head
    }
}

//MARK: - 迭代思想解决链表反转问题

class SolutionB {
    init() {}
    
    // 反转给定的头结点链表
    // 例子：1 -> 2 -> 3 -> 4 -> 5 -> NULL
    // 给定1头部节点，则最后结果为 5 -> 4 -> 3 -> 2 -> 1 -> NULL
    func reverse(by head: ListNode) -> ListNode? {
        var pre: ListNode?
        var current: ListNode?
        var next: ListNode?
        pre = nil
        current = head
        next = head
        
        while current != nil {
            next = current?.next
            // 逐个反转
            current?.next = pre
            // 更新指针位置
            pre = current
            current = next
        }
        // 返回最后的头结点
        return pre
    }
    
    // 反转 [start, end)区间的链表
    func reverse(by start: ListNode, end: ListNode) -> ListNode? {
        var pre: ListNode?
        var current: ListNode?
        var next: ListNode?
        pre = nil
        current = start
        next = start
        
        while current != end {
            next = current?.next
            // 反转
            current?.next = pre
            // 更新
            pre = current
            current = next
        }
        return pre
    }
    
    // k个一组反转链表
    func reverseKGroup(by head: ListNode?, k: Int) -> ListNode? {
        guard let head = head else { return nil }
        // 区间 [start, end)之间包含k个待反转的元素
        let start: ListNode = head
        var end: ListNode = head
        
        for _ in 0..<k {
            if end.next != nil {
                end = end.next!
            }
        }
        
        // 反转前k个元素
        let newHead: ListNode? = self.reverse(by: start, end: end)
        // 递归反转后续链表并连接起来
        start.next = reverseKGroup(by: end, k: k)
        return newHead
    }
    
    
}
