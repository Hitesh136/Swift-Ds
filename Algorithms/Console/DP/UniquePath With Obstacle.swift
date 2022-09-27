//
//  UniquePath With Obstacle.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation
// round 2: 24 Aug
extension Solution {
    
     func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
//     https://leetcode.com/problems/unique-paths-ii/
         func helper(_ m: Int, _ n: Int,_ map: inout [[Int]], _ obstacleGrid: [[Int]]) -> Int {
             
             if m < 0 || n < 0 {
                 return 0
             }
             
             if obstacleGrid[m][n] == 1 {
 //                map[m][n] = 0
                 return 0
             }
             
             
             if m == 0 && n == 0 {
                 return 1
             }
             if map[m][n] != 0 {
                 return map[m][n]
             }
             
             let left = helper(m, n - 1, &map, obstacleGrid)
             let up = helper(m - 1, n, &map, obstacleGrid)
             let res = left + up
             map[m][n] = res
             return res
         }
         
         let m = obstacleGrid.count
         let n = obstacleGrid[0].count
         
         guard m > 0 else { return 0 }
         guard n > 0 else { return 0 }
         
         var map = Array(repeating: Array(repeating: 0, count: n), count: m)
 //        for i in 0..<m {
 //            map[i][0] = 1
 //        }
 //        for i in 0..<n {
 //            map[0][i] = 1
 //        }
         return helper(m - 1, n - 1, &map, obstacleGrid)
     }
}
