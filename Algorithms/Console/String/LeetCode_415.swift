//
//  LeetCode_415.swift
//  Console
//
//  Created by Hitesh Agarwal on 17/05/22.
//

import Foundation
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
}
