//
//  LeetCode_14.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//https://leetcode.com/problems/longest-common-prefix/
// 29 July 2022: Round 2
class LeetCode_14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
            var matchingStr = strs[0]
            if strs.count == 1 {
                return strs[0]
            }
            var i = 1
            while i < strs.count {
                var str1 = strs[i]
                var j = 1
                while j < str1.count && j < matchingStr.count
                        && str1.prefix(j) == matchingStr.prefix(j) {
                     
                    j += 1
                }
                if j == -1 {
                    return ""
                }
                matchingStr = String(str1.prefix(j))
                i += 1
            }
            
            
            return matchingStr
        }
}
