//
//  LeetCode_119.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 29 July 2022: Round 2
class LeetCode_119 {
    func pascelTriangeII(_ rowIndex: Int) -> [Int] {
//    https://leetcode.com/problems/pascals-triangle-ii/submissions/
            var res = [[Int]]()
            var recentRow = [Int]()
            var t = rowIndex + 1
            if t > 0 {
                recentRow = [1]
                res.append(recentRow)
                t -= 1
            }
            
            while t > 0 {
                var nextRow = [1]
                
                var i = 0
                while i + 1 < recentRow.count {
                    let x = recentRow[i] + recentRow[i + 1]
                    nextRow.append(x)
                    i += 1
                }
                
                nextRow.append(1)
                res.append(nextRow)
                recentRow = nextRow
                t -= 1
            }
            return res.last!
        }
     
}
