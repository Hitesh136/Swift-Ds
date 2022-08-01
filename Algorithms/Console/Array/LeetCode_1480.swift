//
//  LeetCode_1480.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 28 July 2022: Round 2
class LeetCode_1480 {
    
    func runningSum(_ _nums: [Int]) -> [Int] {
        //    https://leetcode.com/problems/running-sum-of-1d-array/submissions/
        var nums = _nums
        var sum = nums[0]
        
        for i in 1..<nums.count {
            sum += nums[i]
            nums[i] = sum
        }
        return nums
    }

}
