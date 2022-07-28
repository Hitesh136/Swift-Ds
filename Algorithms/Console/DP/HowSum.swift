//
//  HowSum.swift
//  Console
//
//  Created by Hitesh Agarwal on 25/07/22.
//

import Foundation
func howSum(_ sumV: Int, _ arr: [Int]) -> [Int]? {
    
    if sumV < 0 {
        return nil
    }
    
    if sumV == 0 {
        return []
    }
    
    for ele in arr {
        let newSum = sumV - ele
        if var res = howSum(newSum, arr) {
            res.append(ele)
            return res
        }
    }
    return nil
}

//print(howSum(7, [5, 3, 4, 7]))
