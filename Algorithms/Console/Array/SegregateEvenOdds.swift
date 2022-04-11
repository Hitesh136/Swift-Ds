//
//  SegregateEvenOdds.swift
//  Console
//
//  Created by Hitesh Agarwal on 01/04/22.
//

import Foundation

extension Solution {
    
   func countToSegregateEvenOdds(_ arr: inout [Int]) -> Int {
       //. Given an array arr[], write a function to count minimum number of swaps to segregate even or odd numbers. The functions should put all even number first, and then odd number.
       var evens = 0
       for ele in arr {
           if ele % 2 == 0 {
               evens += 1
           }
       }
       
       var i = 0
       var j = arr.count - 1
       var res = 0
       while i < evens && j >= evens {
           
           if arr[i] % 2 == 0 {
               i += 1
           } else if arr[j] % 2 != 0 {
               j -= 1
           } else {
               arr.swapAt(i, j)
               res += 1
           }
      
       }
       return res
   }
}
