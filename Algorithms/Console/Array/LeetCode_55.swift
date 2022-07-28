//
//  LeetCode_55.swift
//  Console
//
//  Created by Hitesh Agarwal on 23/04/22.
//

import Foundation
//https://leetcode.com/problems/jump-game/
//https://github.com/soapyigu/LeetCode-Swift/blob/master/DP/JumpGame.swift
// 27 July 2022: Round 2
class LeetCode_55 {
    func canJump(_ nums: [Int]) -> Bool {
        
        var maximumIndex = nums[0]
        for (currentIndex, value) in nums.enumerated() {
            
            if currentIndex > maximumIndex {
                return false
            }
            
            maximumIndex = max(maximumIndex, currentIndex + value)
        }
        
        return true
    }
}
