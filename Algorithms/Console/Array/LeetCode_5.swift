//
//  LeetCode_5.swift
//  Console
//
//  Created by Hitesh Agarwal on 07/04/22.
//

import Foundation
class LeetCode_5 {
//https://leetcode.com/problems/longest-palindromic-substring/
    func longestPalindrome(_ s: String) -> String {
        
        var res = ""
        let arr = Array(s)
        for i in 0..<arr.count {
            let evenStr = getPalindrome(i, i, arr)
            let oddStr = getPalindrome(i, i + 1, arr)
            
            let evenStrCount = evenStr.count
            let oddStrCount = oddStr.count
            
            if max(evenStrCount, oddStrCount) > res.count {
                if evenStr.count > oddStr.count {
                    res = evenStr
                } else {
                    res = oddStr
                }
            }
        }
        return res
    }
    
    func getPalindrome(_ left: Int,_ right: Int, _ arr: [Character]) -> String {
        var res = ""
        var i = left
        var j = right
        
        while i >= 0 && j < arr.count && i <= j && arr[i] == arr[j] {
            if i == j {
                res = "\(arr[i])"
            } else {
                res = "\(arr[i])\(res)\(arr[j])"
            }
            i -= 1
            j += 1
        }
        return res
    }
}
