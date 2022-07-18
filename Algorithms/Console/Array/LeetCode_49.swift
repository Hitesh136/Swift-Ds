//
//  LeetCode_49.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_49 {
    func groupAnagrams(_ _strs: [String]) -> [[String]] {
        //        https://leetcode.com/problems/group-anagrams/
        var res = [[String]]()
        var strs = _strs
        var i = 0
        while i < strs.count {
            var word = strs[i]
            var wordSet = Set(Array(word))
            var row = [word]
            var j = i + 1
            while j < strs.count {
                
                var _set = wordSet
                var test = strs[j]
                for char in test {
                    _set.remove(char)
                }
                if _set.isEmpty {
                    row.append(test)
                    strs.remove(at: j)
                } else {
                    j += 1
                }
            }
            res.append(row)
            strs.remove(at: i)
        }
        return res
    }
}
