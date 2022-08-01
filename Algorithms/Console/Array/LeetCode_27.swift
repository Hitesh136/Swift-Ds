//
//  LeetCode_27.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//https://leetcode.com/problems/remove-element/submissions/
// 29 July 2022: Round 2
class LeetCode_27 {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var count = nums.count
        var i = 0
        var j = count - 1
        while i <= j {
            if nums[j] == val {
                j -= 1
            }
            else if nums[i] != val {
                i += 1
            } else {
                nums.swapAt(i, j)
                i += 1
                j -= 1
            }
        }
        nums = Array(nums.prefix(i + 1))
        return i
    }
}
