//
//  LeetCode_392.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

class LeetCode_397 {
    func integerReplacement(_ n: Int) -> Int {
//        https://leetcode.com/problems/integer-replacement/submissions/
        guard n > 1 else { return 0}
        if n & 1 == 0 {
            return 1 + integerReplacement(n / 2)
        } else {
            var count = 0
            let left = integerReplacement(n - 1)
            let right = integerReplacement(n + 1)
            return 1 + min(left, right)
        }
    }
}
