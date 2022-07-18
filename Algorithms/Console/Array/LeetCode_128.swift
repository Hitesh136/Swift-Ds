//
//  LeetCode_128.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_128 {
    func longestConsecutive(_ nums: [Int]) -> Int {
//https://leetcode.com/problems/longest-consecutive-sequence/submissions/
            var set = Set<Int>()
            for num in nums {
                set.insert(num)
            }
            
            var res = 0
            for num in nums {
                if !set.contains(num - 1) {
                    var temp = 0
                    var j = num
                    while set.contains(j) {
                        j += 1
                        temp += 1
                    }
                    
                    res = max(temp, res)
                }
            }
            return res
        }
    
}
