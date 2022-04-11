//
//  MinCostClimbStair.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation

extension Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        //        https://leetcode.com/problems/min-cost-climbing-stairs/
        var table = cost
        table.append(0)
        
        for i in 2..<table.count {
            let one = table[i - 1] + table[i]
            let two = table[i - 2] + table[i]
            table[i] = min(one, two)
        }
        return table.last!
    }
}
