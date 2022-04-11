//
//  DP.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation
//https://leetcode.com/problems/house-robber/submissions/
extension Solution {
    
    func rob(_ nums: [Int]) -> Int {
        var x = 0
        var x_1 = 0
        
        for num in nums {
            let x1 = max(x, x_1 + num)
            x_1 = x
            x = x1
        }
        
        return x
    }
}
