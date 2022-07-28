//
//  LeetCode_11.swift
//  Console
//
//  Created by Hitesh Agarwal on 11/04/22.
//

import Foundation
//https://leetcode.com/problems/container-with-most-water/
// 27 July 2022: Round 2
class LeetCode_11 {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var res = 0
        while left < right {
            let minHeight = min(height[left], height[right])
            let x = (right - left) * minHeight
            res = max(x, res)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return res
    }
}
