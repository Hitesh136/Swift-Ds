//
//  1143.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation
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
        
        func helper(_ text1: String,
                    _ text2: String,
                    _ memo: inout [String: Int]) -> Int {
            
            if text1.isEmpty || text2.isEmpty {
                return 0
            }
            
            let key = "\(text1)_\(text2)"
            if let value = memo[key] {
                return value
            }
            
            let end1 = String(text1.suffix(1))
            let end2 = String(text2.suffix(1))
            
            if end1 == end2 {
                let count = 1 + helper(String(text1.prefix(text1.count - 1)),
                                        String(text2.prefix(text2.count - 1)),
                                        &memo)
                memo[key] = count
                return count
            } else {
                let max = max(helper(String(text1.prefix(text1.count - 1)), text2, &memo),
                              helper(text1, String(text2.prefix(text2.count - 1)), &memo))
                memo[key] = max
                return max
            }
        }
        
        var memo = [String: Int]()
        return helper(text1, text2, &memo)
    }
}
