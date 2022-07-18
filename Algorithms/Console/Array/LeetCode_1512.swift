//
//  LeetCode_1512.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_1512 {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
//    https://leetcode.com/problems/number-of-good-pairs/submissions/
        var map = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if var value = map[num] {
                map[num] = value + 1
            } else {
                map[num] = 1
            }
        }
        
        var count = 0
        for key in map.keys {
            if let value = map[key] {
                count += (value * (value - 1)) / 2
            }
        }
        return count
    }
    
}
