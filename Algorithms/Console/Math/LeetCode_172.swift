//
//  LeetCode_172.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation
//https://www.youtube.com/watch?v=3Hdmv_Ym8PI
//https://leetcode.com/problems/factorial-trailing-zeroes/

class LeetCode_172 {
    
    func trailingZeroes(_ n: Int) -> Int {
        var res = 0
        var x = n
        while x >= 5 {
            res += (x / 5)
            x /= 5
        }
        return res
    }
}
// Round 2 Completed next is LeetCode_728
