//
//  LeetCode_8.swift
//  Console
//
//  Created by Hitesh Agarwal on 11/04/22.
//

import Foundation
//https://leetcode.com/problems/string-to-integer-atoi/
class LeetCode_8 {
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
            let x = (res * 10) + valueInInt
            
            if x > Int(Int32.max) {
                if isNegative {
                    return Int(Int32.min)
                }  else {
                    return Int(Int32.max)
                }
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
