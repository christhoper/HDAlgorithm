import UIKit

var greeting = "Hello, playground"
"""
将一个给定字符串 s 根据给定的行数 numRows ，以从上往下、从左到右进行 Z 字形排列。

比如输入字符串为 "PAYPALISHIRING" 行数为 3 时，排列如下：

P   A   H   N
A P L S I I G
Y   I   R
之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："PAHNAPLSIIGYIR"。

请你实现这个将字符串进行指定行数变换的函数
"""

let content = "ABFGFUCK"
let result = convert(content, 3)
print("结果", result)

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows < 2 {
        return s
    }
    // 每行存的字符数组
    var rowContentList: [String] = []
    // 创建每行初始值
    // 比如 3行：["",  "", ""]
    for _ in 0..<numRows {
        rowContentList.append("")
    }

    // 当前所在行
    var currentRow: Int = 0
    // 是否需要向下
    var goingDown: Bool = false
    var chars: [Character] = Array(s)
    for char in chars {
        // 具体在哪行拼接
        rowContentList[currentRow].append(char)
        // 判断是否向下，然后切换当前所在行数
        if currentRow == 0 || currentRow == numRows - 1 {
            goingDown = !goingDown
        }
        currentRow += goingDown ? 1 : -1
    }
    
    // 比如输入："ABFGFUCK"，row行数为3（分别为row0，row1，row2），遍历到的字符串 char
    // 执行过程：
    // 第一步：char为A，currentRow = 0，goingDown = false，👍row0 append 后 = A，此时判断向下条件（currentRow == 0 || currentRow == numRows - 1）成立，goingDown = true，开始切换到下一行：currentRow +1，等于1
    
    // 第二步：char为B，currentRow = 1，goingDown = true，👍row1 append 后 = B，此时判断向下条件不成立，goingDown还是true，currentRow +1，等于2
    
    // 第三步：char为F，currentRow = 2，goingDown = true，👍row2 append 后 = F，此时是最后一行，向下判断条件成立（currentRow == numRows - 1），goingDown由true变成false，currentRow -1，等于1
    
    // 第四步：char为G，currentRow = 1，goingDown = false，👍row1 append 后 = BG，向下判断条件不成立，goingDown = false，currentRow -1，等于0
    
    // 第五步：char为F，currentRow = 0，goingDown = false，👍row0 append 后 = AF，向下判断条件成立，goingDown由false变true，currentRow +1，等于1
    
    // 第六步：char为U，currentRow = 1，goingDown = true，👍row1 append 后 = BGU，向下判断条件不成立，goingDown = true，currentRow +1，等于2
    
    // 第七步：char为C，currentRow = 2，goingDown = true，👍row2 append 后 = FC，此时是最后一行，向下判断条件成立（currentRow == numRows - 1），goingDown由true变成false，currentRow -1，等于1
    
    // 第八步：char为K，// 第六步：char为U，currentRow = 1，goingDown = false，👍row1 append 后 = BGUK，结束
    // 最后结果，row0：AF + row1：BGUK + row2：FC = AFBGUKAFC
    
    
    // 将每行的结果拼接，得出最终答案
    var result: String = ""
    rowContentList.forEach({ content in
        result += content
    })
    return result
}
