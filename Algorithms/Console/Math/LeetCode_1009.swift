//
//  LeetCode_1009.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation
// 19 July 2022: Round 2
class LeetCode_1009 {
    
 
     func bitwiseComplement(_ N: Int) -> Int {
 //    https://leetcode.com/problems/complement-of-base-10-integer/submissions/
         guard N != 0 else { return 1 }
         var i = 1
         
         while i <= N {
             i <<= 1
         }
         
         return (i - 1) ^ N
     }
     
}
