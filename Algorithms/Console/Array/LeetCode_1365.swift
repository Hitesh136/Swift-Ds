//
//  LeetCode_1365.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_1365 {
    
}



extension Array where Element == Int {
  
      
    
    mutating func smallerNumbersThanCurrent() {
//    https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/
        var counts = Array(repeating: 0, count: 101)
        
        for ele in self {
            counts[ele] += 1
        }
        
        var sum = 0
        for i in 0..<counts.count {
            let temp = counts[i]
            counts[i] = sum
            sum += temp
        }
        
        for i in 0..<count {
            self[i] = counts[self[i]]
        }
    }
}
