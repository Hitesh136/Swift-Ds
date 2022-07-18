//
//  FindMaxSumOfSubSequence.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
extension Array where Element == Int {
    
   
    
    func findMaxSumOfSubSequence() -> Int {
        var sumArray = self
        var posArray = Array(0..<sumArray.count)
        
        for i in 1..<sumArray.count {
            for j in 0..<i {
                if self[j] < self[i] {
                    sumArray[i] = Swift.max(sumArray[j], (self[i] + sumArray[j]))
                    posArray[i] = j
                }
            }
        }
        
        if let maxValue = sumArray.max() {
            return maxValue
        }
        return 0
    }
}
