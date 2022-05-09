//
//  LeetCode_7.swift
//  Console
//
//  Created by Hitesh Agarwal on 11/04/22.
//

import Foundation
//https://leetcode.com/problems/reverse-integer/
class LeetCode_7 {
    func reverse(_ x: Int) -> Int {
        var res = 0
        var n = x
        while n != 0 {
            res = (res * 10) + (n % 10)
            n = n / 10
            
            if res > Int(Int32.max) || res < Int(Int32.min)  {
                return 0
            }
        }
        return res
    }
}

