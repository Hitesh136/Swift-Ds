//
//  LeetCode_14.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
//    https://leetcode.com/problems/longest-common-prefix/
     
        var res = ""
        var i = 0
        var firstWord = Array(strs[0])
        while i < firstWord.count {
            var notMatched = false
            
            var j = 1
            while j < strs.count {
                let word = Array(strs[j])
                if i >= firstWord.count || i >= word.count || word[i] != firstWord[i] {
                    notMatched = true
                    break
                }
                j += 1
            }
            
            if notMatched {
                break
            } else {
                res += String(firstWord[i])
            }
            
            i += 1
        }
        return res
    }
}
