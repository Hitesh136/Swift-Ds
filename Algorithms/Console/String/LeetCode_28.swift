//
//  LeetCode_28.swift
//  Console
//
//  Created by Hitesh Agarwal on 13/04/22.
//

import Foundation
//https://leetcode.com/problems/implement-strstr/
//https://github.com/soapyigu/LeetCode-Swift/blob/master/String/StrStr.swift
class LeetCode_28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }
        
        let arrHey = Array(haystack)
        let arrNed = Array(needle)
        if arrNed.count > arrHey.count {
            return -1
        }
        for i in 0...arrHey.count - arrNed.count {
            if arrHey[i] == arrNed[0] {
                for j in 0..<arrNed.count {
                    if arrHey[i + j] != arrNed[j] {
                        break
                    }
                    
                    if j == arrNed.count - 1 {
                        return i
                    }
                }
            }
        }
        return -1
    }
}
