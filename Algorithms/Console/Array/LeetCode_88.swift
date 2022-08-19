//
//  LeetCode_88.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_88 {}
//3 Aug 2022: Round 2


extension Array where Element == Int {
  
    
    mutating func merge(_ nums2: [Int], _ n: Int) {
//    https://leetcode.com/problems/merge-sorted-array/submissions/
//    https://www.geeksforgeeks.org/merge-two-sorted-arrays-o1-extra-space//
        let m = self.count
        var i = m
        var j = 0
        while i < (m + n) {
            self[i] = nums2[j]
            var k = i
            while k > 0 {
                if self[k - 1] > self[k] {
                    swapAt(k - 1, k)
                } else {
                    break
                }
                k -= 1
            }
            i += 1
            j += 1
        }
    }
}
