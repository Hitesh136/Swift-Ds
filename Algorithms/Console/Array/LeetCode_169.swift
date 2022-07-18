//
//  LeetCode_169.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_169 {
    
}

extension Array where Element == Int {
      
    
    func majorityNumber() -> Int {
//    https://leetcode.com/problems/majority-element/
        var num = self[1]
        var count = 1
        let half = count / 2
        for i in 0..<count {
            let ele = self[i]
            if ele == num {
                count += 1
                if count >= half {
                    return num
                }
            } else {
                num = ele
                count = 1
            }
        }
        return num
    }
}
