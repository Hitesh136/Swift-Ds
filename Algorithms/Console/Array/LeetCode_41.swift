//
//  LeetCode_41.swift
//  Console
//
//  Created by Hitesh Agarwal on 21/04/22.
//

import Foundation
//https://leetcode.com/problems/first-missing-positive/
//https://github.com/soapyigu/LeetCode-Swift/blob/master/Array/FirstMissingPositive.swift
// 27 July 2022: Round 2
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
    
    func firstMissingPositive2(_ nums: [Int]) -> Int {
            
            let nums = Set(nums)
            var i = 1
            while true {
                if !nums.contains(i) {
                    return i
                }
                i += 1
            }
        }
}
