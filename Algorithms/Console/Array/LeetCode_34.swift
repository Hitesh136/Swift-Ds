//
//  LeetCode_34.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/04/22.
//

import Foundation
//https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
// 20 July 2022: Round 2
class LeetCode_34 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        let first = firstOccurences(nums, target)
        let last = lastOccurences(nums, target)
        return [first, last]
         
    }
    
    func firstOccurences(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        var firstOcc = -1
        
        while start <= end {
            let mid = ((end - start) / 2) + start
            
            if nums[mid] == target {
                firstOcc = mid
                end = mid - 1
            }
            
            if nums[mid] > target {
                end -= 1
            }
            
            if nums[mid] < target {
                start += 1
            }
        }
        return firstOcc
    }
    
    func lastOccurences(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        var lastOcc = -1
        
        while start <= end {
            let mid = ((end - start) / 2) + start
            
            if nums[mid] == target {
                lastOcc = mid
                start = mid + 1
            }
            
            if nums[mid] > target {
                end -= 1
            }
            
            if nums[mid] < target {
                start += 1
            }
        }
        return lastOcc
    }
}
