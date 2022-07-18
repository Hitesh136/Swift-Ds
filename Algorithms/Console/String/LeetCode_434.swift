//
//  LeetCode_434.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation

class LeetCode_434 {
    func countSegments(_ s: String) -> Int {
//        https://leetcode.com/problems/number-of-segments-in-a-string/submissions/
        var spaceFound = true
        var count = 0
        for char in s {
            if char == " " {
                spaceFound = true
            } else {
                if spaceFound {
                    spaceFound = false
                    count += 1
                }
            }
        }
        return count
    }
     
    
}
