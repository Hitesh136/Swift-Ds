//
//  LeetCode_1108.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
//https://leetcode.com/problems/defanging-an-ip-address/
class LeetCode_1108 {
    func defangIPaddr(_ address: String) -> String {
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
}
