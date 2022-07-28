//
//  LeetCode_3.swift
//  Console
//
//  Created by Hitesh Agarwal on 07/04/22.
//

import Foundation
// 27 July 2022:  Round 2
class LeetCode_3 {
//    https://leetcode.com/problems/longest-substring-without-repeating-characters/
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var arr = Array(s)
        var map = Set<Character>()
        var maxSoFar = 0
        var i = 0
        for j in 0..<s.count {
            let ele = arr[j]
            
            while map.contains(ele) {
                map.remove(arr[i])
                i += 1
            }
            
            map.insert(ele)
            let newCount = map.count
            maxSoFar = max(maxSoFar, newCount)
            
        }
        return maxSoFar
    }
}
