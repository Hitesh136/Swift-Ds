//
//  LeetCode_33.swift
//  Console
//
//  Created by Hitesh Agarwal on 14/04/22.
//

import Foundation
//https://leetcode.com/problems/search-in-rotated-sorted-array/

// 18 July 2022
class LeetCode_33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        var mid = 0
        while left <= right {
            mid = ((right - left) / 2) + left
            if nums[mid] == target {
                return mid
            }
            
            
            if nums[mid] >= nums[left] {
                //Sorted
                if target >= nums[left] && target <= nums[mid] {
                
//                if nums[mid] <= target && nums[right] <= target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                //Unsorted
                if target >= nums[mid] && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
}
