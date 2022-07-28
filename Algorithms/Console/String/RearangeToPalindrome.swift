//
//  RearangeToPalindrome.swift
//  Console
//
//  Created by Hitesh Agarwal on 23/07/22.
//

import Foundation

func rearangeToPalindrome(str: String) -> String {
    
    var charsCount = Array(repeating: 0, count: 26)
    for s in str {
        var index = Int(s.unicodeScalars.first!.value) - 97
        charsCount[index] += 1
    }
    
    var oddCount = 0
    var oddStr = ""
    for (i, count) in charsCount.enumerated() {
        if count % 2 != 0 {
            oddStr = String(Character(UnicodeScalar(i + 97)!))
            oddCount += 1
            if oddCount > 1 {
                return "NO"
            }
            charsCount[i] -= 1
        }
    }
    var firstHalf = ""
    for (i, count) in charsCount.enumerated() {
        for k in 0..<(count / 2) {
            firstHalf += String(Character(UnicodeScalar(i + 97)!))
        }
    }
    return firstHalf + oddStr + String(firstHalf.reversed())
    
    
}
//
//var str = "yoyoxx"
//print(rearangeToPalindrome(str: str))
