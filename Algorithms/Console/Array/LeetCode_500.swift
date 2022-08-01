//
//  LeetCode_500.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 29 July: 2022: Round 2
class LeetCode_500 {
    func findWords(_ words: [String]) -> [String] {
//    https://leetcode.com/problems/keyboard-row/submissions/
        let set1: Set<Character> = Set("qwertyuiop")
        let set2: Set<Character> = Set("asdfghjkl")
        let set3: Set<Character> = Set("zxcvbnm")
        
        var res = [String]()
        
        for _word in words {
            let word = _word.lowercased()
            var firstCount = 0
            var secondCount = 0
            var thiredCount = 0
            for char in word {
                if set1.contains(char) {
                    firstCount += 1
                }
                if set2.contains(char) {
                    secondCount += 1
                }
                if set3.contains(char) {
                    thiredCount += 1
                }
            }
            
            if firstCount == _word.count || secondCount == _word.count || thiredCount == _word.count {
                res.append(_word)
            }
        }
        return res
    }
}
