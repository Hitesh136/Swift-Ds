//
//  LeetCode_78.swift
//  Console
//
//  Created by Hitesh Agarwal on 26/04/22.
//

import Foundation
//https://leetcode.com/problems/subsets/
//https://www.youtube.com/watch?v=REOH22Xwdkk
// 26 July: Round 2
// Round 3
class LeetCode_78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        
        var res = [[Int]]()
        var tempRes = [Int]()
        func defs(_ i: Int) {
            
            if i == nums.count {
                res.append(tempRes)
                return
            }
            
            tempRes.append(nums[i])
            defs(i + 1)
            
            tempRes.removeLast()
            defs(i + 1)
        }
        
        defs(0)
        return res
    }
}
