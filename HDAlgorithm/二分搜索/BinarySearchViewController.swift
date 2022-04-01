//
//  BinarySearchViewController.swift
//  HDAlgorithm
//
//  Created by bailun on 2020/12/9.
//

import UIKit


class BinarySearchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let array: [Int] = [1, 4, 5, 7, 9, 11, 90, 91]
        let index = bsearch(searchArray: array, target: 11)
        print(index as Any)
        let repeateArray: [Int] = [1, 1, 1, 1, 4, 5, 7, 9, 9, 9, 9, 9, 11, 90, 91]
        let rIndex = bsearchRepeatFirst(searchArray: repeateArray, target: 1)
        print(rIndex as Any)
        let lIndex = bsearchRepeatLast(searchArray: repeateArray, target: 9)
        print(lIndex as Any)
        let mIndex = bsearchMorethanFirst(searchArray: array, target: 7)
        print(mIndex as Any)
        
    }
    
    
    func bsearch(searchArray: [Int], target: Int) -> Int? {
        guard !searchArray.isEmpty else {
            return nil
        }
    
        var low: Int = 0
        var high: Int = searchArray.count - 1
        while low <= high {
            // 将除以2的操作换成位运算，又可以防止溢出（low+high）之和非常大的时候，又提升了性能（计算机处理除以运算比处理位运算速度慢）
            let middle: Int = low + ((high-low)>>1)
            if searchArray[middle] == target {
                return middle
            } else if searchArray[middle] < target {
                low = middle + 1
            } else {
                high = middle - 1
            }
        }
        
        return nil
    }

}


extension BinarySearchViewController {
    
    /// 查找第一个值等于给定值的元素，返回下标
    func bsearchRepeatFirst(searchArray: [Int], target: Int) -> Int? {
        guard searchArray.isEmpty == false else {
            return nil
        }
        
        var low: Int = 0
        var high: Int = searchArray.count - 1

        while low <= high {
            let middle = low + ((high - low)>>1)
            if searchArray[middle] < target {
                low = middle + 1
            } else if searchArray[middle] > target {
                high = middle - 1
            } else {
                if middle == 0 || searchArray[middle-1] != target {
                    return middle
                } else {
                    high = middle - 1
                }
            }
        }
        
        return nil
    }
    
    /// 查找最后一个值等于给定值的元素，返回下标
    func bsearchRepeatLast(searchArray: [Int], target: Int) -> Int? {
        guard searchArray.isEmpty == false else {
            return nil
        }
        
        var low: Int = 0
        var high: Int = searchArray.count - 1
        
        while low <= high {
            let middle = low + ((high - low)>>1)
            if searchArray[middle] < target {
                low = middle + 1
            } else if searchArray[middle] > target {
                high = middle - 1
            } else {
                if middle == searchArray.count-1 || searchArray[middle + 1] != target {
                    return middle
                } else {
                    low = middle + 1
                }
            }
        }
        
        return nil
    }
    
    /// 查找第一个大于等于给定值的元素
    func bsearchMorethanFirst(searchArray: [Int], target: Int) -> Int? {
        guard searchArray.isEmpty == false else {
            return nil
        }
        
        var low: Int = 0
        var high: Int = searchArray.count - 1
        while low <= high {
            let middle = low + ((high - low)>>1)
            if searchArray[middle] > target {
                if middle == 0 || searchArray[middle-1] < target {
                    return middle
                }
                high = middle - 1
            } else {
                low = middle + 1
            }
        }
        
        return nil
    }
}
