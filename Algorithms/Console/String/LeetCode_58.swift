//
//  LeetCode_58.swift
//  Console
//
//  Created by Hitesh Agarwal on 17/05/22.
//

import Foundation

class LeetCode_58 {
    func lengthOfLastWord(_ s: String) -> Int {
        
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
  
     
}
