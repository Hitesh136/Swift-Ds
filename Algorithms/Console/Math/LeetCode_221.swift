//
//  LeetCode_221.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

class LeetCode_221 {
    
  
    func isPowerOfTwo(_ n: Int) -> Bool {
//        https://leetcode.com/problems/power-of-two/submissions/
           guard n > 0 else { return false }
           return (n & (n - 1)) == 0
       }
}
// Round 2 Completed next is LeetCode_67
