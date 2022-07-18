//
//  LeetCode_941.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_941 {
    
}



extension Array where Element == Int {

   
    
    func validMountainArray(_ arr: [Int]) -> Bool {
        //    https://leetcode.com/problems/valid-mountain-array/submissions/
               
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
