//
//  SubArrayWithGivenSum.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class SubArrayWithGivenSum {
    
}
extension Array where Element: Numeric, Element: Comparable {
    
    /*
     Subarray with given sum
     https://practice.geeksforgeeks.org/problems/subarray-with-given-sum/0
     */
    
    func subArray(withSum sum: Element) -> [Element] {
        guard !self.isEmpty else {
            return []
        }
        var total = self.first!
        var lastIndex = 0
        for i in 1..<self.count {
            let ele = self[i]
            total += ele
            if total > sum {
                total -= self[lastIndex]
                lastIndex += 1
            }
            if total == sum {
                return Array(self[lastIndex...i])
            }
        }
        return []
    }
}
