//
//  LeetCode_1304.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_1304 {
    func sumZero(_ n: Int) -> [Int] {
//    https://leetcode.com/problems/find-n-unique-integers-sum-up-to-zero/submissions/
        var res = [Int]()
        for i in 0..<(n/2) {
            res.append(i + 1)
            res.append(-(i + 1))
        }
        
        if n % 2 != 0 {
            res.append(0)
        }
        return res
    }
}
