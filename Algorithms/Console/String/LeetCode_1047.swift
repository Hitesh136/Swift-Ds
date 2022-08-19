//
//  LeetCode_1047.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 16 Aug 2022: Round 2
//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/

class LeetCode_1047 {     
    func removeDuplicates(_ s: String) -> String {
          var stack = [Character]()
        
        for c in s {
            if let last = stack.last, last == c {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
}
