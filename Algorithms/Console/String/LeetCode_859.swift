//
//  LeetCode_859.swift
//  Console
//
//  Created by Hitesh Agarwal on 17/05/22.
//

import Foundation
class LeetCode_859 {
    
    
    
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        //    https://leetcode.com/problems/buddy-strings/submissions/
        guard s.count == goal.count, !s.isEmpty, !goal.isEmpty else {
            return false
        }
        var firstIndex = 0
        var secondIndex = 0
        var count = 0
        
        var sArr = Array(s)
        var gArr = Array(goal)
        
        for i in 0..<s.count {
            if sArr[i] != gArr[i] {
                
                if count == 0 {
                    firstIndex = i
                } else if count == 1 {
                    secondIndex = i
                } else {
                    return false
                }
                count += 1
            }
        }
        gArr.swapAt(firstIndex, secondIndex)
        return gArr == sArr
    }
}
