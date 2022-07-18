//
//  LeetCode_20.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//https://leetcode.com/problems/valid-parentheses/
class LeetCode_20 {
    func isValid(_ s: String) -> Bool {
            var stack = [Character]()
           
           for c in s {
               
               if c == "}" {
                   if let top = stack.last, top == "{" {
                       stack.removeLast()
                   } else {
                       return false
                   }
               } else if c == ")" {
                   if let top = stack.last, top == "(" {
                       stack.removeLast()
                   } else {
                       return false
                   }
               } else if c == "]" {
                   if let top = stack.last, top == "[" {
                       stack.removeLast()
                   } else {
                       return false
                   }
               } else {
                   stack.append(c)
               }
           }
           
           return stack.isEmpty
       }
}
