//
//  LeetCode_485.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation

class LeetCode_485 {
    
}


extension Array where Element == Int {

   
    
    func getConsecutivOnes() -> Int {
//        https://leetcode.com/problems/max-consecutive-ones/
        var maxNow = 0
        var maxSoFar = 0
        for ele in self {
            if ele == 0 {
                maxNow = 0
            } else if ele == 1 {
                maxNow += 1
                maxSoFar = Swift.max(maxNow, maxSoFar)
            }
        }
        
        return maxSoFar
    }
}
