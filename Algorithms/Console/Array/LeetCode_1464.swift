//
//  LeetCode_1464.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 29 July 2022: Round 2
class LeetCode_1464 {
    func maxProduct(_ nums: [Int]) -> Int {
//    https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/
        var first = 0
        var second = 0
        for num in nums {
            if num > first {
                second = first
                first = num
            } else if num <= first && num > second {
                second = num
            }
        }
        return (first - 1) * (second - 1)
    }
}
