//
//  SubArrayWithGivenSum.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//https://practice.geeksforgeeks.org/problems/subarray-with-given-sum/0
// 3 Aug 2022: Round 2
class SubArrayWithGivenSum {
    
    func getSum(sum: Int, ofArr arr: [Int]) -> (Int, Int) {
        
        var i = 0
        var j = 1
        var res = arr[i] + arr[j]
        
        while i < arr.count && j < arr.count {
            
            if res == sum {
                return (i + 1, j + 1)
            } else if res < sum {
                j += 1
                res += arr[j]
            } else if res > sum {
                res -= arr[i]
                i += 1
            }
        }
        return (-1, -1)
    }
    
    
}
