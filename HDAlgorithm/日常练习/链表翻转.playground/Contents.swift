import UIKit

var greeting = "Hello, playground"

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

var head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)

let result: ListNode = reverseList(head)!
printLinkNode(result)

// 打印链表
func printLinkNode(_ head: ListNode?) {
    var current: ListNode? = head
    while let node = current {
        print(node.val, terminator: "\n")
        current = node.next
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    guard head != nil || head?.next != nil else {
        return nil
    }
    
    var current = head
    var pre: ListNode? = nil
    
    while current != nil {
        var temp = current?.next
        current?.next = pre
        pre = current
        current = temp
    }
    
    
    return pre
}
