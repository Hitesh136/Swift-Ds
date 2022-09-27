//
//  1143.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation

// Round 2 
//
//extension Solution {
//    func longestCommonSubsequence(_ text1: String,
//                                  _ text2: String) -> Int {
//        
////        func helper(_ text1: String,
////                    _ text2: String,
////                    _ memo: inout [String: Int]) -> Int {
////            
////            if text1.isEmpty || text2.isEmpty {
////                return 0
////            }
////            
////            let key = "\(text1)_\(text2)"
////            if let value = memo[key] {
////                return value
////            }
////            
////            let end1 = String(text1.suffix(1))
////            let end2 = String(text2.suffix(1))
////            
////            if end1 == end2 {
////                var count = 1
////                count += longestCommonSubsequence(String(text1.prefix(text1.count - 1)),
////                                                  String(text2.prefix(text2.count - 1)))
////                memo[key] = count
////                return count
////            } else {
////                let left = longestCommonSubsequence(String(text1.prefix(text1.count - 1)), text2)
////                let right = longestCommonSubsequence(text1, String(text2.prefix(text2.count - 1)))
////                let max = max(left, right)
//////                memo[ke]
////            }
////        }
////        
////        var memo = [String: Int]()
////        return helper(text1, text2, &memo)
//    }
//}
//

class LeetCode_1143 {
    func longestCommonSubsequence(_ text1: String,
                                     _ text2: String) -> Int {
            
           
           var arr1 = Array(text1)
           var arr2 = Array(text2)
           var count1 = arr1.count
           var count2 = arr2.count
           
           var memo = [String: Int]()
           func helper(_ i: Int, _ j: Int) -> Int {
               
               if i == count1 || j == count2 {
                   return 0
               }
               
               let key = "\(i),\(j)"
               if let value = memo[key] {
                   return value
               }
               
               var res = 0
               if arr1[i] == arr2[j] {
                   res = 1 + helper(i + 1, j + 1)
               } else {
                   res = max(helper(i + 1, j), helper(i, j + 1))
               }
               
               memo[key] = res
               return res
           }
           return helper(0, 0)
       }
}
