//
//  LeetCode_867.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

extension Matrix {
    
    
    func transformMatrix() {
//    https://leetcode.com/problems/transpose-matrix/
        for r in 0..<arr.count {
            for c in 0..<arr[0].count {
                
                if c > r {
                    if c < arr.count {
                        if r < arr[c].count {
                            let temp = self[r, c]
                            self[r, c] = self[c, r]
                            self[c, r] = temp
                        }
                    }
                }
            }
        }
    }
}
