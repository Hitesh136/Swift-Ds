//
//  LeetCode_1351.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 29 July 2022: Round 2
class LeetCode_1351 {
    func countNegatives(_ grid: [[Int]]) -> Int {
//        https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/submissions/
           var rowsCount = grid.count
           var colCount = grid[0].count
           var count = 0
           for i in 0..<rowsCount {
               var row = grid[i]
               var j = colCount - 1
               while j >= 0 && row[j] < 0 {
                   count += 1
                   j -= 1
               }
           }
           return count
       }
}
