//
//  LeetCode_69.swift
//  Console
//
//  Created by Hitesh Agarwal on 23/04/22.
//

import Foundation
//https://leetcode.com/problems/sqrtx/
//https://github.com/soapyigu/LeetCode-Swift/blob/master/Search/Sqrtx.swift
// 20 July 2022 Round 2 
class LeetCode_69 {
    func mySqrt(_ x: Int) -> Int {
        
        var left = 0
        var right = (x / 2) + 1
        
        while left <= right {
            let mid = ((right - left) / 2) + left
            
            if mid * mid == x {
                return mid
            }
            
            if mid * mid < x {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return right
    }
}
