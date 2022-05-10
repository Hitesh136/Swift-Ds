//
//  LeetCode_50.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

//https://leetcode.com/problems/powx-n/
//https://www.youtube.com/watch?v=g9YQyYi4IQQ&ab_channel=NeetCode

class LeetCode_50 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        
        if x == 1 { return 1 }
        if n == 0 { return 1 }
        
        let isNegative = n < 0
         
        var res = myPow(x, abs(n) / 2)
        res = res * res
        if abs(n) % 2 != 0 {
            res = res * x
        }
        
        if isNegative {
            return 1 / res
        }
        return res
    }
}
// Round 2 Completed next is LeetCode_633
