//
//  LeetCode_844.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_844 {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        //        https://leetcode.com/problems/backspace-string-compare/submissions/
        
        
        var a1 = Array(s)
        for i in 0..<a1.count {
            let ele = a1[i]
            if ele == "#" {
                a1.remove(at: i)
                if i > 0 {
                    a1.remove(at: i - 1)
                }
            }
        }
        
        var a2 = Array(t)
        for i in 0..<a2.count {
            let ele = a2[i]
            if ele == "#" {
                a2.remove(at: i)
                if i > 0 {
                    a2.remove(at: i - 1)
                }
            }
        }
        let s1 = a1.map{ String($0) }.joined()
        let s2 = a2.map{ String($0) }.joined()
        return s1 == s2
    }
}
