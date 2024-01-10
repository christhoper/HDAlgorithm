//
//  SourtViewController.swift
//  HDAlgorithm
//
//  Created by bailun on 2022/2/16.
//

import UIKit

class SourtViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let array: [Int] = [1, 5, 3, 4, 6, 2, 0, 7]
        let buble = bubbleSort(array, true)
        print(buble)
        let insert = insertSort(array, true)
        print(insert)
        let merge = mergeSort(array)
        print(merge)
        let quick = quickSort(array)
        print(quick)
    }
    
    
    /// 冒泡(空间复杂度O(1),时间复杂度:最好情况O(n),最坏情况O(n²))
    /// 升序还是降序排序
    func bubbleSort(_ sortArry: [Int], _ ascending: Bool) -> [Int] {
        if sortArry.count <= 1 {
            return sortArry
        }
    
        var result: [Int] = sortArry
        for i in 0..<result.count {
            // 提前退出循环标志
            var flag: Bool = false
            for j in 0..<result.count-i-1 {
                if ascending {
                    // 交互
                    if result[j] > result[j+1] {
                        let tmp = result[j]
                        result[j] = result[j+1]
                        result[j+1] = tmp
                        flag = true
                    }
                } else {
                    if result[j] < result[j+1] {
                        let tmp = result[j+1]
                        result[j+1] = result[j]
                        result[j] = tmp
                        flag = true
                    }
                }
            }
            
            // 没有交换过，直接跳出
            if !flag {
                break
            }
        }
        
        return result
    }
    
    /// 插入排序
    func insertSort(_ sortArry: [Int], _ ascending: Bool) -> [Int] {
        if sortArry.count <= 1 {
            return sortArry
        }
        
        var result: [Int] = sortArry
        for i in 1..<result.count {
            var j = i
            let tmp = result[j]
            // 升序还是降序关键判断 tmp < sortArry[j-1] ： tmp > sortArry[j-1]
            if ascending {
                while j > 0 && tmp < result[j-1] {
                    // 交换
                    result[j] = result[j-1]
                    j -= 1
                }
                result[j] = tmp
            } else {
                while j > 0 && tmp > result[j-1] {
                    result[j] = result[j-1]
                    j -= 1
                }
                result[j] = tmp
            }
        }
        return result
    }
}

extension SourtViewController {
    
    /// 归并排序
    /// 时间复杂度：O(nlogn)
    /// 空间复杂度：O(n)
    func mergeSort(_ sortArry: [Int]) -> [Int] {
        if sortArry.count <= 1 {
            return sortArry
        }
        var result: [Int] = sortArry
        self.process(&result, left: 0, right: result.count-1)
        return result
    }
    
    // 将数组二分
    func process(_ sortArray: inout [Int], left: Int, right: Int) {
        // 递归停止条件
        guard left != right else { return }

        let middle = left + ((right-left)>>1)
        process(&sortArray, left: left, right: middle)
        process(&sortArray, left: middle + 1, right: right)
        merge(&sortArray, left: left, middle: middle, right: right)
    }
    
    // 合并排序后的子数组
    func merge(_ sortArray: inout [Int], left: Int, middle: Int, right: Int) {
        var mergeArray: [Int] = []
        var leftLocation: Int = left
        var rightLocation: Int = middle + 1
        
        while leftLocation <= middle && rightLocation <= right {
            if sortArray[leftLocation] <= sortArray[rightLocation] {
                mergeArray.append(sortArray[leftLocation])
                leftLocation += 1
            } else {
                mergeArray.append(sortArray[rightLocation])
                rightLocation += 1
            }
        }
        
        while leftLocation <= middle {
            mergeArray.append(sortArray[leftLocation])
            leftLocation += 1
        }
        
        while rightLocation <= right {
            mergeArray.append(sortArray[rightLocation])
            rightLocation += 1
        }
        
        var index = left
        for value in mergeArray {
            sortArray[index] = value
            index += 1
        }
    }
}


extension SourtViewController {
    
    /// 快排
    /// 设置基准值，找分区点，递归排序
    func quickSort(_ sortArray: [Int]) -> [Int] {
        if sortArray.count <= 1 {
            return sortArray
        }
        
        var result: [Int] = sortArray
        quick(&result, left: 0, right: result.count-1)
        return result
    }
    
    
    func quick(_ sortArray: inout [Int], left: Int, right: Int) {
        // 递归结束条件
        guard left < right else { return }
        // 找分区点
        let middle = partition(&sortArray, left: left, right: right)
        // middle左边区
        quick(&sortArray, left: left, right: middle-1)
        quick(&sortArray, left: middle + 1, right: right)
    }
    
    /// 获取分区点
    func partition(_ sortArray: inout [Int], left: Int, right: Int) -> Int {
        // 设置基准值
        let pivot: Int = sortArray[right]
        // 设定插入位置
        var index: Int = left
        for i in left..<right {
            if sortArray[i] < pivot {
                sortArray.swapAt(index, i)
                index += 1
            }
        }
        
        
        sortArray.swapAt(index, right)
        return index
    }
}
