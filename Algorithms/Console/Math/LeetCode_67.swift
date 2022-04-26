//
//  LeetCode_67.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation
class LeetCode_67 {
    
    func addBinary(_ a: String, _ b: String) -> String {
//        https://leetcode.com/problems/add-binary/submissions/
            var carry = 0
            let arr1 = Array(a)
            let arr2 = Array(b)
            var res = ""
            var i = arr1.count - 1
            var j = arr2.count - 1
            
            while i >= 0 || j >= 0 || carry != 0 {
                var sum = carry
                
                if i >= 0  {
                    sum += Int(String(arr1[i]))!
                    i -= 1
                }
                
                if j >= 0 {
                    sum += Int(String(arr2[j]))!
                    j -= 1
                }
                
                
                let ans = sum % 2
                carry = sum / 2
                res = "\(ans)" + res
            }
            return res
        }
    
}
