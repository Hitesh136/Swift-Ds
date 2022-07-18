//
//  LeetCode_1089.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_1089 {
    
}



extension Array where Element == Int {

    
    mutating func duplicateZeros() -> [Int] {
        // https://leetcode.com/problems/duplicate-zeros/
        var index = 0
        let _count = self.count
        while index < _count {
            
            if self[index] == 0 {
                self.insert(0, at: index)
                index += 2
            } else {
                index += 1
            }
        }
        
        let pre = self.prefix(_count)
        return Array(pre)
    }
}
