//
//  LeetCode_4.swift
//  Console
//
//  Created by Hitesh Agarwal on 07/04/22.
//

import Foundation
class LeetCode_4 {
//    https://leetcode.com/problems/median-of-two-sorted-arrays/
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
            var i = 0
            var j = 0
            var res = [Int]()
            while i < nums1.count && j < nums2.count {
                if nums1[i] < nums2[j] {
                    res.append(nums1[i])
                    i += 1
                } else {
                    res.append(nums2[j])
                    j += 1
                }
            }
            
            for k in i..<nums1.count {
                res.append(nums1[k])
            }
            
            for k in j..<nums2.count {
                res.append(nums2[k])
            }
            
            var count = res.count
            if count % 2 == 0 {
                count = (count / 2) - 1
                return ((Double(res[count] + res[count + 1])) / 2)
            } else {
                count = count / 2
                return Double(res[count])
            }
        }
}
