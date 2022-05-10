//
//  LeetCode_633.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

class LeetCode_633 {
    func judgeSquareSum(_ c: Int) -> Bool {
//        https://leetcode.com/problems/sum-of-square-numbers/
        var left = 0
        var right = Int(sqrt(Double(c)))
        
        while left <= right {
            let sum = (left * left) + (right * right)
            if sum == c {
                return true
            } else if sum > c {
                right -= 1
            } else {
                left += 1
            }
        }
        return false
    }
}
// Round 2 Completed next is LeetCode_172
