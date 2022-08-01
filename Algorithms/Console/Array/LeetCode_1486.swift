//
//  LeetCode_1486.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 29 July 2022: Round 2
class LeetCode_1486 {
    
    func xorOperation(_ n: Int, _ start: Int) -> Int {
//        https://leetcode.com/problems/xor-operation-in-an-array/
        var nums = Array(repeating: 0, count: n)
        var res = 0
        for i in 0..<nums.count {
            let x = start + (2 * i)
//            if i == 0 {
//                res = x
//            }
            res ^= x
            nums[i] = x
        }
        
        return res
    }
}
