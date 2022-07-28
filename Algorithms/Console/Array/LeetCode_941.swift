//
//  LeetCode_941.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//https://leetcode.com/problems/valid-mountain-array/
// 22 July 2022: Round 2
class LeetCode_941 {
     
    func validMountainArray(_ arr: [Int]) -> Bool {
           
        var i = 0
        while i + 1 < arr.count && arr[i] < arr[i + 1] {
            i += 1
        }
        
        if i == 0 || (i + 1) == arr.count {
            return false
        }
        
        while i + 1 < arr.count {
            if arr[i] <= arr[i + 1] {
                return false
            }
            i += 1
        }
        return true
    }
}
