//
//  LeetCode_343.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_344 {
//    https://leetcode.com/problems/reverse-string/
    func reverseString(_ s: inout [Character]) {
             var i = 0
            var j = s.count - 1
            while i < j {
                s.swapAt(i, j)
                i += 1
                j -= 1
            }
        }
}
