//
//  LeetCode_238.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_238 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        https://leetcode.com/problems/product-of-array-except-self/submissions/
        var lefts = Array(repeating: 1, count: nums.count)
        var rights = Array(repeating: 1, count: nums.count)
        
        for i in 1..<lefts.count {
            lefts[i] = lefts[i - 1] * nums[ i - 1]
        }
        
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            rights[i] = rights[i + 1] * nums[ i + 1]
        }
        
        var res = nums
        for i in 0..<nums.count {
            res[i] = lefts[i] * rights[i]
        }
        return res
    }
}
