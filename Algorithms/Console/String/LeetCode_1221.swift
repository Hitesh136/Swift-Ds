//
//  LeetCode_1221.swift
//  Console
//
//  Created by Hitesh Agarwal on 17/05/22.
//

import Foundation
// https://leetcode.com/problems/split-a-string-in-balanced-strings/

// 16 Aug 2022: Round 2
class LeetCode_1221 {
    func balancedStringSplit(_ s: String) -> Int {
        var stack = [Character]()
        var l = 0
        var r = 0
        var count = 0
        for c in s {
            if c == "R" {
                r += 1
            } else if c == "L" {
                l += 1
            }
            
            if r == l {
                count += 1
            }
        }
        return count
    }
}
