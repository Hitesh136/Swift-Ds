//
//  ToLowerCase.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 25 July 2022: Round 2
class ToLowerCase {
    
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
}

