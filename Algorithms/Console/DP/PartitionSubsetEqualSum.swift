//
//  PartitionSubsetEqualSum.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation

// Round 2
class PartitionSubsetEqualSum {
    
     
     func canPartition_BadApproach(_ nums: [Int]) -> Bool {
         //    https://leetcode.com/problems/partition-equal-subset-sum/
         
         func helper(_ currentSum: Int,_ totalSum: Int,_ index: Int,_ arr: [Int]) -> Bool {
             if currentSum == totalSum {
                 return true
             }
             
             if currentSum > totalSum || index >= arr.count {
                 return false
             }
             
             let left = helper(currentSum, totalSum, index + 1, arr)
             let right = helper(currentSum + arr[index], totalSum, index + 1, arr)
             
             return left || right
         }
         var sum = nums.reduce(0, +)
         if sum & 1 != 0 {
             return false
         }
         return helper(0, sum / 2, 0, nums)
     }
     
     func canPartition(_ nums: [Int]) -> Bool {
         //    https://leetcode.com/problems/partition-equal-subset-sum/
             
             func helper(_ currentSum: Int,_ totalSum: Int,_ index: Int,_ arr: [Int],_ memo: inout [String: Bool]) -> Bool {
                 let key = "\(currentSum)\(index)"
                  
                 if currentSum == totalSum {
                     return true
                 }
                 
                 if currentSum > totalSum || index >= arr.count {
                     return false
                 }
                 if let value = memo[key] {
                     return value
                 }
                  
                 memo[key] = helper(currentSum, totalSum, index + 1, arr, &memo) ||
                             helper(currentSum + arr[index], totalSum, index + 1, arr, &memo)
                 return memo[key] ?? false
             }
             var sum = nums.reduce(0, +)
             var memo = [String: Bool]()
             if sum & 1 != 0 {
                 return false
             }
             return helper(0, sum / 2, 0, nums, &memo)
             
         }
}
