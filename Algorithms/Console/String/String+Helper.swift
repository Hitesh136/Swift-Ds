//
//  String+Helper.swift
//  Console
//
//  Created by Hitesh Agarwal on 08/03/22.
//

import Foundation

extension Solution {
//https://therahulgoel.medium.com/top-array-programs-for-interview-swift-5-0-part-8-63cdbdf3d2dc

    func reverseString(_ s: inout [Character]) {
//    https://leetcode.com/problems/reverse-string/submissions/
        var i = 0
        var j = s.count - 1
        while i < j {
            s.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
    
    func toLowerCase(_ s: String) -> String {
        var res = ""
        for char in s {
            if (65...90).contains(char.asciiValue!) {
                let asi = (char.asciiValue! + 32)
                let str = String(UnicodeScalar(UInt8(asi)))
                res.append(str)
            } else {
                res.append(char)
            }
        }
        return res
    }
    
    func isValid(_ s: String) -> Bool {
//        https://therahulgoel.medium.com/top-string-programs-for-interview-swift-5-0-part-1-20f9180545da
        var stack = [Character]()
        
        for c in s {
            
            if c == "}" {
                if let top = stack.last, top == "{" {
                    stack.removeLast()
                } else {
                    return false
                }
            } else if c == ")" {
                if let top = stack.last, top == "(" {
                    stack.removeLast()
                } else {
                    return false
                }
            } else if c == "]" {
                if let top = stack.last, top == "[" {
                    stack.removeLast()
                } else {
                    return false
                }
            } else {
                stack.append(c)
            }
        }
        
        return stack.isEmpty
    }
    
    func countSegments(_ s: String) -> Int {
//        https://leetcode.com/problems/number-of-segments-in-a-string/submissions/
        var spaceFound = true
        var count = 0
        for char in s {
            if char == " " {
                spaceFound = true
            } else {
                if spaceFound {
                    spaceFound = false
                    count += 1
                }
            }
        }
        return count
    }
    
    func defangIPaddr(_ address: String) -> String {
//    https://leetcode.com/problems/defanging-an-ip-address/
        var arr = Array(address)
        var i = 0
        while i < arr.count {
            if arr[i] == "." {
                arr.insert(contentsOf: "[.]", at: i)
                i += 3
                arr.remove(at: i)
            } else {
                i += 1
            }
        }
        return arr.map{ String($0) }.joined()
        
    }
    
    func removeDuplicates(_ s: String) -> String {
//        https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/submissions/
        var stack = [Character]()
        
        for c in s {
            
            if let last = stack.last, last == c {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
    
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
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
//    https://leetcode.com/problems/valid-anagram/submissions/
        if s.count != t.count {
            return false
        }
        
        var map = [Character: Int]()
        for c in s {
            if let count = map[c] {
                map[c] = count + 1
            } else {
                map[c] = 1
            }
        }
        for c in t {
            if let count = map[c] {
                if count > 1 {
                    map[c] = count - 1
                } else {
                    map[c] = nil
                }
            }
        }
        
        return map.isEmpty
    }
    
    func lengthOfLastWord(_ s: String) -> Int {
        
//    https://leetcode.com/problems/length-of-last-word/submissions/
            var arr = Array(s)
            var i = s.count - 1
            var count = 0
            while i >= 0 {
                if arr[i] == " " {
                    if count > 0 {
                        return count
                    }
                } else {
                    count += 1
                }
                i -= 1
            }
            return count
        }
    
    func reverseVowels(_ s: String) -> String {
//    https://leetcode.com/problems/reverse-vowels-of-a-string/submissions/
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
    
    func balancedStringSplit(_ s: String) -> Int {
//    https://leetcode.com/problems/split-a-string-in-balanced-strings/submissions/
        var l = 0
        var r = 0
        var count = 0
        for c in s {
            if c == "R" {
                r += 1
            } else if c == "L" {
                l += 1
            }
            
            if r == l {
                count += 1
            }
        }
        return count
    }
    
    func numUniqueEmails(_ emails: [String]) -> Int {
//    https://leetcode.com/problems/unique-email-addresses/submissions/
            var _set = Set<String>()
            for email in emails {
                var res = ""
                var isPlusFound = false
                
                for (index, char) in email.enumerated() {
                    if char == "." {
                        continue
                    } else if char == "+" {
                        isPlusFound = true
                    } else if isPlusFound || char == "@"{
                        if char == "@" {
                            isPlusFound = false
                            let suf = email.suffix(email.count - index)
                            res.append(String(suf))
                            break
                        }
                    } else {
                        res.append(char)
                    }
                }
                
                _set.insert(res)
            }
            return _set.count
        }
    
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
//    https://leetcode.com/problems/buddy-strings/submissions/
            guard s.count == goal.count, !s.isEmpty, !goal.isEmpty else {
                return false
            }
            var firstIndex = 0
            var secondIndex = 0
            var count = 0
            
            var sArr = Array(s)
            var gArr = Array(goal)
             
            for i in 0..<s.count {
                if sArr[i] != gArr[i] {
                    
                    if count == 0 {
                        firstIndex = i
                    } else if count == 1 {
                        secondIndex = i
                    } else {
                        return false
                    }
                    count += 1
                }
            }
            gArr.swapAt(firstIndex, secondIndex)
            return gArr == sArr
        }
    
    
    func addStrings(_ num1: String, _ num2: String) -> String {
//        https://leetcode.com/problems/add-strings/submissions/
            var arr1 = Array(num1.reversed())
            var arr2 = Array(num2.reversed())
            
            var carry = 0
            var i = 0
            var j = 0
            var res = ""
            
            while i < arr1.count || j < arr2.count || carry != 0 {
                var sum = carry
                if i < arr1.count {
                    sum += Int(String(arr1[i]))!
                    i += 1
                }
                
                if j < arr2.count {
                    sum += Int(String(arr2[j]))!
                    j += 1
                }
                
                if sum > 9 {
                    sum = sum % 10
                    carry = 1
                } else {
                    carry = 0
                }
                
                res.append("\(sum)")
            }
            return String(res.reversed())
        }
}
