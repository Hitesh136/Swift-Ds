//
//  LeetCode_258.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation
class LeetCode_258 {
    func addDigits(_ num: Int) -> Int {
//        https://leetcode.com/problems/add-digits/submissions/
            // guard num > 0 else { return 0}
            // guard num > 9 else { return num}
            var n = num
            
            while n > 9 {
                var sum = 0
                var res = n
                while res > 0 {
                    let lastDigit = res % 10
                    sum += lastDigit
                    res = res / 10
                }
                
                n = sum
            }
            
            return n
        }
    
}
