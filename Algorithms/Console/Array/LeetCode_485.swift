//
//  LeetCode_485.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//https://leetcode.com/problems/max-consecutive-ones/
// 21 July 2022: Round 2 done
class LeetCode_485 {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var max = 0
        var maxSoFar = 0
        for num in nums {
            if num == 1 {
                max += 1
                if max > maxSoFar {
                    maxSoFar = max
                }
            } else {
                max = 0
            }
        }
        return maxSoFar
    }
}

