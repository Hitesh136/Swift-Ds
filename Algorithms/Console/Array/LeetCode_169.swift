//
//  LeetCode_169.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 21 July 2022: Round 2 done
class LeetCode_169 {
    func majorityElement(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        
        var _count = nums.count
        for num in nums {
            if var val = map[num] {
                val += 1
                if val > (nums.count / 2) {
                    return num
                }
                map[num] = val
            } else {
                map[num] = 1
            }
        }
        return nums[0]
    }
}
