//
//  LeetCode_56.swift
//  Console
//
//  Created by Hitesh Agarwal on 23/04/22.
//

import Foundation
//https://leetcode.com/problems/merge-intervals/
// 27 July 2022: Round 2
class LeetCode_56 {
    
    func merge(_ _intervals: [[Int]]) -> [[Int]] {
        
        var intervals = [[Int]]()
        intervals = _intervals.sorted{ $0[0] < $1[0] }
        
        var res = [[Int]]()
        res.append(intervals[0])
        
        var i = 1
        var lastIndex = 0
        while i < intervals.count {
            var currentElement = intervals[i]
            var lastElement = res[lastIndex]
            
            if currentElement[0] <= lastElement[1] {
                res[lastIndex][1] = max(currentElement[1], lastElement[1])
            } else {
                lastIndex += 1
                res.append(currentElement)
            }
            i += 1
        }
        return res
    }
}
