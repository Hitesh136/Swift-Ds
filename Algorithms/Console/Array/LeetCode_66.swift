//
//  LeetCode_66.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//        https://leetcode.com/problems/plus-one/submissions/
class LeetCode_66 {
     
    func plusOne(_ digits: [Int]) -> [Int] {
            var i = digits.count - 1
            var res = [Int]()
            var carry = 1
            while i >= 0 || carry != 0 {
                var sum = carry
                
                if i >= 0 {
                    sum += digits[i]
                }
                
                carry = sum / 10
                sum = sum % 10
                res.append(sum)
                i -= 1
            }
            return Array(res.reversed())
        }
}
