//
//  LeetCode_674.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_674 {
    
}

extension Array where Element == Int {
 
    
    func findLCIS() -> Int {
        //https://leetcode.com/problems/longest-continuous-increasing-subsequence/
        var maxCurr = 1
        var maxSoFar = 1
        for i in 1..<count {
            if self[i - 1] < self[i] {
                maxCurr += 1
                maxSoFar = Swift.max(maxCurr, maxSoFar)
            } else {
                maxCurr = 1
            }
        }
        return maxSoFar
    }
}
