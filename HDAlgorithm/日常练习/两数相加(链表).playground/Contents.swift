import UIKit

var greeting = "Hello, playground"

"""
给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
"""

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

let link1 = ListNode(9)
link1.next = ListNode(9)
link1.next?.next = ListNode(9)

let link2 = ListNode(9)
//link2.next = ListNode(6)
//link2.next?.next = ListNode(4)

let result = addTwoNumbers(link1, link2)
printLinkNode(result)

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var link1 = l1
    var link2 = l2
    var head: ListNode?
    var current: ListNode?
    // 进位数，两数相加大于10，则为1，否则为0
    var carry: Int = 0
    
    while link1 != nil || link2 != nil {
        // 补充两链表长度不相等时的处理，不相等时短的链表补充0
        var x: Int = link1?.val ?? 0
        var y: Int = link2?.val ?? 0
        // 相加，并加上进位数，比如前面的两数x+y>10，则carry = 1，反之0，这一步只是初步处理sum，还没处理超过10的情况
        var sum = x + y + carry
        // 处理超过10的时候的情况
        let node = ListNode(sum % 10)
        // 第一个节点
        if head == nil {
            head = node
            current = head
        } else {
            // 赋值给新节点val，比如节点1，计算完l1和l2的节点，然后将结果赋值新列表对应的节点
            current?.next = node
            // 新的链表往下一个节点移动
            current = node
        }
        // 等处理完sum，再处理进位数（因为首次carry = 0）
        carry = sum / 10
        link1 = link1?.next
        link2 = link2?.next
        
    }
    
    // 遍历完，如果进位数不为0，在新列表加多一个节点，比如9999+1，则carry为1，
    // l1: 9999
    // l2: 1000
    // carry: 1
    // 链表结果：00001
    if carry == 1 {
        current?.next = ListNode(carry)
    }
    
    return head
    
}

// 打印链表
func printLinkNode(_ head: ListNode?) {
    var current: ListNode? = head
    while let node = current {
        print(node.val, terminator: "\n")
        current = node.next
    }
}
