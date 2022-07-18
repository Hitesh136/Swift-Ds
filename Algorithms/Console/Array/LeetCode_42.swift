//
//  LeetCode_42.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_42 {
    
    func trap(_ height: [Int]) -> Int {
        //https://leetcode.com/problems/trapping-rain-water/submissions/
        var left = Array(repeating: 0, count: height.count)
        
        left[0] = height[0]
        for i in 1..<height.count {
            left[i] = max(left[i - 1], height[i])
        }
        
        var right = Array(repeating: 0, count: height.count)
        right[height.count - 1] = height[height.count - 1]
        for i in stride(from: height.count - 2, through: 0, by: -1) {
            right[i] = max(right[i + 1], height[i])
        }
         
        var count = 0
        for i in 0..<height.count {
            let ele = height[i]
            count += min(left[i], right[i]) - height[i]
        }
        return count
    }
}
