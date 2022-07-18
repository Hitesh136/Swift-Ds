//
//  LeetCode_27.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_27 {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//        https://leetcode.com/problems/remove-element/submissions/
        var count = nums.count
        var i = 0
        var j = count - 1
        while i < j {
            if nums[i] == val {
                nums.swapAt(i, j)
                count -= 1
                j -= 1
            } else {
                i += 1
            }
        }
        
        while nums.last! == val {
            nums.removeLast()
        }
        return count
    }
}
