//
//  LeetCode_118.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//https://leetcode.com/problems/pascals-triangle/submissions/
// 29 July 2022: Round 2
class LeetCode_118 {
    func generate(_ numRows: Int) -> [[Int]] {
            var res = [[1]]
            var recentRow = [1]
            
            if numRows == 1 {
                return res
            }
            
            var t = 1
            while t + 1 <= numRows {
                
                var temp = [1]
                var i = 0
                while (i + 1) < recentRow.count {
                    temp.append(recentRow[i] + recentRow[i + 1])
                    i += 1
                }
                temp.append(1)
                res.append(temp)
                recentRow = temp
                t += 1
            }
            return res
        }
}
