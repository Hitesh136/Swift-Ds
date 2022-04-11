//
//  UniquePaths.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation
extension Solution {
    
    func uniquePaths_BadApproach(_ m: Int, _ n: Int) -> Int {
        
// https://github.com/soapyigu/LeetCode-Swift/blob/master/DP/UniquePaths.swift
        func helper(_ m: Int, _ n: Int) -> Int {
             
            if m < 0 || n < 0 {
                return 0
            }
            if m == 0 && n == 0 {
                return 1
            }
            
            let up = helper(m - 1, n)
            let left = helper(m, n - 1)
            let res = left + up
            return res
        }
        return helper(m - 1, n - 1)
    }
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
// https://github.com/soapyigu/LeetCode-Swift/blob/master/DP/UniquePaths.swift
        func helper(_ m: Int, _ n: Int,_ map: inout [[Int]]) -> Int {

            if m == 1 || n == 1 {
                return 1
            }

            if map[m - 1][n - 1] != 0 {
                return map[m - 1][n - 1]
            }

            let left = uniquePaths(m, n - 1)
            let up = uniquePaths(m - 1, n)
            let res = left + up
            map[m - 1][n - 1] = res
            return res
        }

        var map = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            map[i][0] = 1
        }
        for i in 0..<n {
            map[0][i] = 1
        }
        return helper(m, n, &map)
    }
 
    
}
