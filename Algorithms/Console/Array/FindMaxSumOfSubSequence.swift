//
//  FindMaxSumOfSubSequence.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 28 July 2022: Round 2
extension Array where Element == Int {
     
    func findMaxSumOfSubSequence() -> Int {
        if let _max = self.max(), _max <= 0 {
            return _max
        }
        
        var sum = 0
        for ele in self {
            if ele > 0 {
                sum += ele
            }
        }
        return sum
    }
}
