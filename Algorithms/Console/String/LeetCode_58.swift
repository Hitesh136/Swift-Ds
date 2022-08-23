//
//  LeetCode_58.swift
//  Console
//
//  Created by Hitesh Agarwal on 17/05/22.
//

import Foundation
//19 Aug 2022: Round 2
class LeetCode_58 {
    
    func lengthOfLastWord_0(_ s: String) -> Int {
        var chars = Array(s)
        var i = chars.count - 1
        var end = chars.count - 1
        while i >= 0 && chars[i] == " " {
            i -= 1
        }
        var count = 0
        
        while i >= 0 && chars[i] != " "  {
            count += 1
            i -= 1
        }
        return count
    }
    
    func lengthOfLastWord_1(_ s: String) -> Int {
        
//    https://leetcode.com/problems/length-of-last-word/submissions/
            var arr = Array(s)
            var i = s.count - 1
            var count = 0
            while i >= 0 {
                if arr[i] == " " {
                    if count > 0 {
                        return count
                    }
                } else {
                    count += 1
                }
                i -= 1
            }
            return count
        }
  
    func lengthOfLastWord_2(_ s: String) -> Int {
            var chars = Array(s)
            var i = chars.count - 1
            var end = chars.count - 1
            while i >= 0 && chars[i] == " " {
                i -= 1
            }
            end = i
            while i >= 0 {
                if chars[i] == " " {
                    return end - i
                }
                i -= 1
            }
            return end - i
        }
}
