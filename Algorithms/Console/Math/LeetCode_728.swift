//
//  LeetCode_728.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

class LeetCode_728 {
     
     func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
 //        https://leetcode.com/problems/self-dividing-numbers/submissions/
             var start = left
             var res = [Int]()
             while start <= right {
                 if isSelfDividingNumber(start) {
                     res.append(start)
                 }
                 start += 1
             }
             return res
         }
         
         func isSelfDividingNumber(_ num: Int) -> Bool {
             var number = num
             var status = true
             while number > 0 {
                 var lastDigit = number % 10
                 if lastDigit != 0 {
                     if num % lastDigit != 0 {
                         status = false
                         break
                     }
                 } else {
                     status = false
                     break
                 }
                 number /= 10
             }
             return status
         }
    
}
// Round 2 Completed next is LeetCode_728
