//
//  LeetCode_1252.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_1252 {
    func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        //        https://leetcode.com/problems/cells-with-odd-values-in-a-matrix/submissions/
        var grid = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for ind in indices {
            var r = ind[0]
            var c = ind[1]
            
            grid[r] = grid[r].map{ $0 + 1 }
            var i = 0
            while i < m {
                grid[i][c] += 1
                i += 1
            }
        }
        
        var count = 0
        for row in grid {
            for ele in row {
                if ele % 2 != 0 {
                    count += 1
                }
            }
        }
        return count
    }
}
