//
//  ReverseArrayOfGroup.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class ReverseArrayOfGroup {
    
}


extension Array where Element: Numeric, Element: Comparable {
     
    
    /*
        Reverse array in groups
        https://www.geeksforgeeks.org/reverse-an-array-in-groups-of-given-size/
    */
    func reverseArrayOfGroup(k: Int) -> [Element] {
        
        var i = Swift.min(k - 1, self.count - 1)
        var j = k
        var res = [Element]()
        for _ in 0..<self.count {
            res.append(self[i])
            j -= 1
            
            if j == 0 {
                j = k
                i += Swift.min((2 * k) - 1, self.count - 1)
            } else {
                i -= 1
            }
        }
        return res
    }
}
