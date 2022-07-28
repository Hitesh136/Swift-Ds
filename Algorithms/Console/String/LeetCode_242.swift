//
//  LeetCode_242.swift
//  Console
//
//  Created by Hitesh Agarwal on 17/05/22.
//

import Foundation
// 25 July 2022: Round 2
//https://leetcode.com/problems/valid-anagram/submissions/
class LeetCode_242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
            if s.count != t.count {
                return false
            }
            
            var map = [Character: Int]()
            for c in s {
                if let count = map[c] {
                    map[c] = count + 1
                } else {
                    map[c] = 1
                }
            }
            for c in t {
                if let count = map[c] {
                    if count > 1 {
                        map[c] = count - 1
                    } else {
                        map[c] = nil
                    }
                }
            }
            
            return map.isEmpty
        }
}
