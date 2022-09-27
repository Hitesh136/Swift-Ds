//
//  climbStairs.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation
// Round 2: 24 Aug 2022
extension Solution {
    func climbStairs(_ n: Int) -> Int {
//    https://leetcode.com/problems/climbing-stairs/submissions/
           if n < 0 {
               return 0
           }
           
           if n == 0 || n == 1 {
               return 1
           }
           
           var prev = 0
           var post = 1
           var total = 1
           for i in 1...n {
               total = prev + post
               
               prev = post
               post = total
           }
        return total
    }
    
   
    
}
