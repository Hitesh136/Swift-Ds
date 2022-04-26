//
//  LeetCode_762.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

class LeetCode_762 {
    
    
     func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
 //    https://leetcode.com/problems/prime-number-of-set-bits-in-binary-representation/submissions/
         func isPrime(_ num: Int) -> Bool {
             
             guard num >= 2 else { return false}
             var i = 2
             while i * i <= num {
                 if num % i == 0 {
                     return false
                 }
                 i += 1
             }
             return true
         }
         
         var primesCount = 0
         var num = left
         while num < right {
             var count = 0
             var x = num
             while x > 0 {
                 let lastSetBit = x & 1
                 if lastSetBit == 1 {
                     count += 1
                 }
                 x = x >> 1
             }
             
             if isPrime(count) {
                 primesCount += 1
             }
             num += 1
         }
         
         return primesCount
     }
}
