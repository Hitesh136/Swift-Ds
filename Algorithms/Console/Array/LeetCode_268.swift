//
//  LeetCode_268.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
extension Array where Element == Int {
     
     
    
    func missingNumber() -> Int {
//    https://leetcode.com/problems/missing-number/
        let sum = self.reduce(0, +)
        let _count = self.count
        let totalSum = (_count * (_count + 1)) / 2
        return totalSum - sum
    }
}
class LeetCode_268 {
    
}
