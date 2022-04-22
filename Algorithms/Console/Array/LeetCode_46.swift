//
//  LeetCode_46.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

//https://leetcode.com/problems/permutations/
//https://www.youtube.com/watch?v=s7AvT7cGdSo&t=146s
extension Solution {
    func permute(_ _nums: [Int]) -> [[Int]] {
            
        var result = [[Int]]()
        var nums = _nums
       
        if nums.count == 1 {
            return [nums]
        }
    
        for _ in 0..<nums.count {
            let n = nums.removeFirst()
            
            let perms = permute(nums)
            
            for i in 0..<perms.count {
                var perm = perms[i]
                perm.append(n)
                result.append(perm)
            }
            nums.append(n)
        }
        return result
    }
}
