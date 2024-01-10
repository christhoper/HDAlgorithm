//
//  TrainingViewController.swift
//  HDAlgorithm
//
//  Created by bailun on 2022/11/17.
//

import UIKit

class TrainingViewController: BaseViewController {
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("跳转", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 44)
        view.addSubview(button)

        let a = 2 << 3
        print(a)
        let b = 2 >> 1
        
        var test: [Character] = ["A", "B", "C", "D"]
        self.reverseChar(&test)
        print(test)
        deleted0()
        deleted1()
        deleted2()
        deleted3()
        binarySearch()
        twoSum()
        reserverString()
        isPalindrome()
        longPalindrome()
        reverse()
    }
    
    @objc func nextPage() {
        let testController = TestViewController()
        var seconPage = SecondPage(rereiveData: "传入的数据")
        let mediator = MediatorClass()
        seconPage.outputBlock = {
            print("刷新")
        }

        testController.receiver = seconPage
        navigationController?.pushViewController(testController, animated: true)
    }
    
    /// 删除一个排序好的数组中的重复元素，只能原地修改，不用考虑新数组后面的元素
    func deleted0() {
        var dataSource = [0, 0, 1, 2, 2, 4, 4, 5, 9, 10]
        let lengh = FSPointer.deletedDuplicates(dataSource: &dataSource)
        print("result", dataSource, lengh)
    }
    
    /// 根据指定的目标值，删除一个未排序的数组中重复的元素，原地修改，返回新数组的长度，不用考虑新数组后面的元素
    func deleted1() {
        var dataSource = [1, 0, 0, 1, 2, 2, 4, 4, 5, 9, 10, 0]
        let lengh = FSPointer.deletedDuplicatedWithTarget(list: &dataSource, target: 2)
        print("result1", dataSource, lengh)
    }
    
    /// 将数组中的某个元素（比如0）移动都数组的最后面，原地修改
    func deleted2() {
        var dataSource = [1, 0, 0, 1, 4, 2, 4, 4, 5, 9, 10, 0]
        FSPointer.moveZerosToEnd(list: &dataSource)
        print("新数组", dataSource)
    }
    
    /// 链表去重
    func deleted3() {
        let listNode = ListNode()
        listNode.append(1)
        listNode.append(2)
        listNode.append(2)
        listNode.append(3)
        listNode.append(4)
        listNode.append(5)
        listNode.append(5)
        listNode.append(5)

        print("处理前的链表")
        let nodeResult = FSPointer.deletedDuplicatesListNode(listNode: listNode)
        print("处理后的链表")
    }
    
    func binarySearch() {
        var dataSource = [0, 0, 1, 2, 2, 4, 4, 5, 9, 10, 0]
        let index = LRPointer.binarySearch(list: &dataSource, target: 4)
        print("二分查找", index)
    }
    
    func twoSum() {
        let dataSource = [0, 1, 2, 2, 3, 4, 4, 5, 6, 9, 10]
        let result = LRPointer.twoSum(list: dataSource, target: 9)
        print("求的数组", result)
    }
    
    /// 字符串反转
    func reserverString() {
        let char1: Character = "a"
        let char2: Character = "b"
        let char3: Character = "c"
        let char4: Character = "d"
        var content = [char1, char2, char3, char4]
        LRPointer.reverseString(chars: &content)
        print("反转结果", content)
    }
    
    func isPalindrome() {
        let string = "abaaba"
        let isPal = LRPointer.isPalindrome(content: string)
        print("是否是回文", isPal)
    }
    
    func longPalindrome() {
        let string = "gfdbabadrte"
        let result = LRPointer.longPalindrome(content: string)
        print("最长回文字符串", result)
    }
    
    func reverse() {
        let listNode = ListNode()
        listNode.append(1)
        listNode.append(2)
        listNode.append(3)
        listNode.append(4)
        listNode.append(5)
        print(listNode)
        Recursion.recursion(listNode: listNode)
        print(listNode)
    }
 }

extension TrainingViewController {
    
    func reverseChar(_ char: inout [Character]) {
        print("字符串反转")
        var begin = 0
        var end = char.count - 1
        while begin < end {
            char.swapAt(begin, end)
            begin += 1
            end -= 1
        }
    }
}
