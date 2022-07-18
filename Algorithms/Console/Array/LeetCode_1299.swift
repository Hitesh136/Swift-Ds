//
//  LeetCode_1299.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class LeetCode_1299 {
    func replaceElements(_ arr: [Int]) -> [Int] {
//        https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/
        var maxArr = Array(repeating: -1, count: arr.count)
        for i in stride(from: arr.count - 2, through: 0, by: -1) {
            maxArr[i] = max(arr[i + 1], maxArr[i + 1])
        }
        return maxArr
    }
}
