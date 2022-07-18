//
//  LeetCode_929.swift
//  Console
//
//  Created by Hitesh Agarwal on 17/05/22.
//

import Foundation
 

class LeetCode_929 {
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
}
