//
//  LeetCode_75.swift
//  Console
//
//  Created by Hitesh Agarwal on 25/04/22.
//

import Foundation
//https://medium.com/nerd-for-tech/75-sort-colors-15768309bf2f
//https://leetcode.com/problems/sort-colors/
// 26 July 2022: Round 2
class LeetCode_75 {
    func sortColors(_ nums: inout [Int]) {
        
        var start = 0
        var mid = 0
        var end = nums.count - 1
        
        while mid <= end  {
            let val = nums[mid]
            
            if val == 0 {
                nums.swapAt(start, mid)
                start += 1
                mid += 1
            } else if val == 1 {
                mid += 1
            } else {
                nums.swapAt(mid, end)
                end -= 1
            }
        }
    }

}
