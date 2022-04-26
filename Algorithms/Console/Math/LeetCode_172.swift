//
//  LeetCode_172.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

class LeetCode_172 {
    
    func trailingZeroes(_ n: Int) -> Int {
//    https://leetcode.com/problems/factorial-trailing-zeroes/
           var res = 0
           var x = 5
           while n / x >= 1 {
               res += n / x
               x *= 5
           }
           return res
       }
}
