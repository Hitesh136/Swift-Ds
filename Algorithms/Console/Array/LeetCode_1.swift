//
//  LeetCode_1.swift
//  Console
//
//  Created by Hitesh Agarwal on 07/04/22.
//

import Foundation

//https://leetcode.com/problems/two-sum/submissions/
class LeetCode_1 {
   func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       var map = [Int: Int]()
       for (index, num) in nums.enumerated() {
           map[num] = index
       }
       
       for (index, num) in nums.enumerated() {
           
           if let res = map[target - num], res != index {
               return [res, index].sorted()
           }
       }
       return [0, 0]
   }
}
