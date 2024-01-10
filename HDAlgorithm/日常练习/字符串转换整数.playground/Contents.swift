import Cocoa

var greeting = "Hello, playground"

"""
请你来实现一个 myAtoi(string s) 函数，使其能将字符串转换成一个 32 位有符号整数（类似 C/C++ 中的 atoi 函数）。

函数 myAtoi(string s) 的算法如下：

读入字符串并丢弃无用的前导空格
检查下一个字符（假设还未到字符末尾）为正还是负号，读取该字符（如果有）。 确定最终结果是负数还是正数。 如果两者都不存在，则假定结果为正。
读入下一个字符，直到到达下一个非数字字符或到达输入的结尾。字符串的其余部分将被忽略。
将前面步骤读入的这些数字转换为整数（即，"123" -> 123， "0032" -> 32）。如果没有读入数字，则整数为 0 。必要时更改符号（从步骤 2 开始）。
如果整数数超过 32 位有符号整数范围 [−2的31次方,  2的31 − 1] ，需要截断这个整数，使其保持在这个范围内。具体来说，小于 −231 的整数应该被固定为 −2的31次方 ，大于 2的31次方 − 1 的整数应该被固定为 2的31次方 − 1 。
返回整数作为最终结果。
"""


let test = "-9223372036854775809"
let result = myAtoi(test)

print(result)

// 状态机
enum ATOIState {
    case start
    case num
    case end
}

func myAtoi(_ s: String) -> Int {
    var characters: String = ""
    var state: ATOIState = .start
    // 是否负数
    var isMinus: Bool = false
    
    for character in s {
        if character.isWhitespace && state == .start {
            continue
        } else if character == "-" && state == .start {
            isMinus = true
            state = .num
        } else if character == "+" && state == .start {
            isMinus = false
            state = .num
        } else if character.isNumber {
            switch state {
            case .start:
                state = .num
                isMinus = false
                characters.append(character)
                
            case .num:
                state = .num
                characters.append(character)
                
            default:
                // 退出
                state = .end
                break
            }

        } else {
            // 退出
            state = .end
            break
        }
    }
    
    guard !characters.isEmpty else { return 0 }
    let min: Int = -(1 << 31)
    let max: Int = (1 << 31) - 1
    
    if isMinus {
        var num: Int = Int(characters) ?? min
        if num < 0 {
            return min
        } else {
            num = -num
            if num < min {
                return min
            } else {
                return num
            }
        }
    } else {
        let num: Int = Int(characters) ?? max
        if num > max {
            return max
        }
        
        return num
    }
    
}
