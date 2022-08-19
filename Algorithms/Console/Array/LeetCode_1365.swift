//
//  LeetCode_1365.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/
// 3 Aug 2022: Round 2
class LeetCode_1365 {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var counts = Array(repeating: 0, count: 101)
        
        for ele in nums {
            counts[ele] += 1
        }
        
        var sum = 0
        for i in 0..<counts.count {
            let temp = counts[i]
            counts[i] = sum
            sum += temp
        }
        
        var res = nums
        for i in 0..<nums.count {
            let ele = nums[i]
            res[i] = counts[ele]
        }
        return res
    }
}
 
