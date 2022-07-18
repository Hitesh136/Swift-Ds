//
//  SortByParity.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class SortByParity {
    
}

extension Array where Element == Int {

    
    
    mutating func sortByParity() {
        var j = -1
        for (index, ele) in self.enumerated() {
            if ele % 2 == 0 {
                j += 1
                swapAt(j, index)
            }
        }
    }
}
