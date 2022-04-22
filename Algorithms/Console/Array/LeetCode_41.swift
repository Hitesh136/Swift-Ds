//
//  LeetCode_41.swift
//  Console
//
//  Created by Hitesh Agarwal on 21/04/22.
//

import Foundation
//https://leetcode.com/problems/first-missing-positive/
//https://github.com/soapyigu/LeetCode-Swift/blob/master/Array/FirstMissingPositive.swift
class LeetCode_41 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        
        let set = Set(nums)
        
        for i in 0..<nums.count {
            if !set.contains(i + 1) {
                return i + 1
            }
        }
        
        return nums.count + 1
    }
}
