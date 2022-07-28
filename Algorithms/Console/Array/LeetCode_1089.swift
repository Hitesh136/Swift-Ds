//
//  LeetCode_1089.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 21 July 2022: Round 2 done.
class LeetCode_1089 {
    func duplicateZeros(_ arr: inout [Int]) {
        var i = 0
        let count = arr.count
        while i < count {
            if arr[i] == 0 {
                arr.insert(0, at: i)
                arr.removeLast()
                i += 1
            }
            i += 1
        }
    }
}
