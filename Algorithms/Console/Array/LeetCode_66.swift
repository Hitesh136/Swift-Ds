//
//  LeetCode_66.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_66 {
    
    func plusOne(_ digits: [Int]) -> [Int] {
//        https://leetcode.com/problems/plus-one/submissions/
        var shouldContinue = true
        var i = digits.count - 1
        var res = digits
        var carry: Int?
        while shouldContinue && i >= 0 {
            let ele = digits[i] + 1
            if ele == 10 {
                res[i] = 0
                i -= 1
                carry = 1
            } else {
                res[i] = ele
                carry = nil
                shouldContinue = false
            }
        }
        
        if i < 0 ,
           let _carry = carry {
            
            res.insert(1, at: 0)
        }
        return res
    }
}
