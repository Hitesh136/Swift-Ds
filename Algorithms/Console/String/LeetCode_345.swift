//
//  LeetCode_345.swift
//  Console
//
//  Created by Hitesh Agarwal on 17/05/22.
//

import Foundation
//https://leetcode.com/problems/reverse-vowels-of-a-string/
// 19 Aug: 2022, Round 2 
class LeetCode_345 {
    func reverseVowels(_ s: String) -> String {
        var vowels = Set("aeiouAEIOU")
        var arr = Array(s)
        var i = 0
        var j = arr.count - 1
        while i < j {
            if !vowels.contains(arr[i]) {
                i += 1
            } else if !vowels.contains(arr[j]) {
                j -= 1
            } else {
                arr.swapAt(i, j)
                i += 1
                j -= 1
            }
        }
        return String(arr)
    }
}
