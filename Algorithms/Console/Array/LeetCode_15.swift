//
//  LeetCode_15.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_15 {
    func threeSum(_ _nums: [Int]) -> [[Int]] {
        //https://leetcode.com/problems/3sum/submissions/
        var map = [Int: Int]()
        var res = Set<[Int]>()
        let sum = 0
        var nums = _nums
        nums = nums.sorted()
        print(nums)
        for (index, value) in nums.enumerated() {
            map[value] = index
        }
        
        for i in 0..<nums.count - 2 {
            for j in i + 1..<nums.count - 1 {
                
                let sum2 = sum - (nums[i] + nums[j])
                if let k = map[sum2],
                   k > i,
                   k > j {
                    let resArr = [nums[i], nums[j], sum2]
//                    resArr.sort()
                    print("\(i) \(j) \(k): \(resArr)")
                    res.insert(resArr)
                }
            }
        }
        return Array(res)
    }
    
}
