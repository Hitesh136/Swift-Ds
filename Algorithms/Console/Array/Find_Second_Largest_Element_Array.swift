//
//  Find_Second_Largest_Element_Array.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 29 July 2022: Round 2
class Find_Second_Largest_Element_Array {
    
    func getTwoLargestNumber(_ nums: [Int]) -> [Int] {
//    https://www.geeksforgeeks.org/find-second-largest-element-array/
        var first = 0
        var second = 0
        for num in nums {
            if num > first {
                second = first
                first = num
            } else if num < first && num > second {
                second = num
            }
        }
        return [second, first]
    }
}
