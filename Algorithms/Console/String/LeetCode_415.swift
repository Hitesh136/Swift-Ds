//
//  LeetCode_415.swift
//  Console
//
//  Created by Hitesh Agarwal on 17/05/22.
//

import Foundation
// 19 Aug 2022: Round 2
class LeetCode_415 {
    func addStrings(_ num1: String, _ num2: String) -> String {
//        https://leetcode.com/problems/add-strings/submissions/
            var arr1 = Array(num1.reversed())
            var arr2 = Array(num2.reversed())
            
            var carry = 0
            var i = 0
            var j = 0
            var res = ""
            
            while i < arr1.count || j < arr2.count || carry != 0 {
                var sum = carry
                if i < arr1.count {
                    sum += Int(String(arr1[i]))!
                    i += 1
                }
                
                if j < arr2.count {
                    sum += Int(String(arr2[j]))!
                    j += 1
                }
                
                if sum > 9 {
                    sum = sum % 10
                    carry = 1
                } else {
                    carry = 0
                }
                
                res.append("\(sum)")
            }
            return String(res.reversed())
        }
    
    func addStrings2(_ num1: String, _ num2: String) -> String {
        // without reversing
        var arr1 = Array(num1)
        var arr2 = Array(num2)
        
        var maxIndex = max(arr1.count , arr2.count)
        var res = Array(repeating: 0, count: maxIndex + 1)
        var carry = 0
        var i = arr1.count - 1
        var j = arr2.count - 1
        var resIndex = res.count - 1
        while i >= 0 || j >= 0 || carry != 0 {
            var sum = carry
            if i >= 0 {
                sum += Int(String(arr1[i]))!
                i -= 1
            }
            
            if j >= 0 {
                sum += Int(String(arr2[j]))!
                j -= 1
            }
            
            if sum > 9 {
                sum = sum % 10
                carry = 1
            } else {
                carry = 0
            }
             
            res[resIndex] = sum
            resIndex -= 1
        }
//        var resArr = res.map{ String($0) }.joined(separator: "")
        if res[0] == 0 {
            let resSuff = Array(res.suffix(res.count - 1))
            let fin = resSuff.map{ String($0) }.joined(separator: "")
            return fin
        } else {
            return res.map{ String($0) }.joined(separator: "")
        }
    }
}
