import Foundation
 
extension Solution {
    func myAtoi(_ s: String) -> Int {
        var res = 0
        var isNegative = false
        
        let arr = Array(s)
        var index = 0
        
        while index < arr.count,
              arr[index] == " " {
            index += 1
        }
        
        if index < arr.count {
            if arr[index] == "-" {
                isNegative = true
                index += 1
            } else if arr[index] == "+" {
                isNegative = false
                index += 1
            }
        }
        
        
        while index < arr.count,
              let valueInInt = Int(String(arr[index])) {
            
            if index == 10 {
                print("ss")
            }
            let x = (res * 10) + valueInInt
            
            if isNegative && (x * -1) > Int(Int32.min){
                return Int(Int32.min)
            } else if x > Int(Int32.max) {
                return Int(Int32.max)
            } else {
                res = x
            }
            index += 1
        }
        
        if isNegative {
            return res * -1
        } else {
            return res
        }
    }
}
print(Solution().myAtoi("21474836460"))
