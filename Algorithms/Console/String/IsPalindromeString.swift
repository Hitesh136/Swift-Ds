//
//  isPalindromeString.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 28 July 2022
class IsPalindromeString {
    func isPalindrome(_ s: String) -> Bool {
        
        func charFor(_ c: Character) -> Character? {
            let asciiValue = c.asciiValue!
            if (65...90).contains(asciiValue) {
                return Character(UnicodeScalar(asciiValue + 32))
            } else if (97...122).contains(asciiValue) || (48...57).contains(asciiValue) {
                return c
            }
            return nil
        }
        
        let chars = Array(s)
        var i = 0
        var j = chars.count - 1
        
        while i < j {
            guard let startChar = charFor(chars[i]) else {
                i += 1
                continue
            }
            guard let endChar = charFor(chars[j]) else {
                j -= 1
                continue
            }
            
            if startChar != endChar {
                return false
            }
            
            i += 1
            j -= 1
        }
        return true
    }
}
