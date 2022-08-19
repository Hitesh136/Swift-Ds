//
//  LeetCode_922.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 3 Aug 2022: Round 2 
class LeetCode_922 {
    
}

extension Array where Element == Int {
  
     
    mutating func sortArrayByParityII() {
//    https://leetcode.com/problems/sort-array-by-parity-ii/submissions/
//    https://www.geeksforgeeks.org/even-numbers-even-index-odd-numbers-odd-index/
        var evenItr = 0
        var oddItr = 1
        let n = self.count
        while true {
            while evenItr < n && self[evenItr] % 2 == 0 {
                evenItr += 2
            }
            
            while oddItr < n && self[oddItr] % 2 != 0 {
                oddItr += 2
            }
            
            if evenItr < n && oddItr < n {
                swapAt(evenItr, oddItr)
            } else {
                return
            }
        }
    }
}
