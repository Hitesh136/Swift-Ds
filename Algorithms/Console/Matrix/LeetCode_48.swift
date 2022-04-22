//
//  LeetCode_48.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation
//https://leetcode.com/problems/rotate-image/
//https://www.youtube.com/watch?v=fMSJSS7eO1w&ab_channel=NeetCode

class LeetCode_48 {
    func rotate(_ matrix: inout [[Int]]) {
        var l = 0
        var r = matrix.count - 1
        
        while l <= r {
            var top = l
            var bottom = r
            
            for i in 0..<(r - l) {
                
                let topLeft = matrix[top][l + i]
                matrix[top][l + i] = matrix[bottom - i][l]
                matrix[bottom - i][l] = matrix[bottom][r - i]
                matrix[bottom][r - i] = matrix[top + i][r]
                matrix[top + i][r] = topLeft
            }
            
            r -= 1
            l += 1
            
        }
    }
}
