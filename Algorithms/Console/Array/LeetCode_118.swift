//
//  LeetCode_118.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_118 {
    func generate(_ numRows: Int) -> [[Int]] {
//        https://leetcode.com/problems/pascals-triangle/submissions/
            var res = [[Int]]()
            var recentRow = [Int]()
            var t = numRows
            if t > 0 {
                recentRow = [1]
                res.append(recentRow)
                t -= 1
            }
            
            while t > 0 {
                var nextRow = [1]
                
                var i = 0
                while i + 1 < recentRow.count {
                    var x = recentRow[i] + recentRow[i + 1]
                    nextRow.append(x)
                    i += 1
                }
                
                nextRow.append(1)
                res.append(nextRow)
                recentRow = nextRow
                t -= 1
            }
            return res
        }
}
