//
//  Sort012.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 3 Aug 2022: Round 2
class Sort012 {
    
}

extension Array where Element: Numeric, Element: Comparable {
    
 
    /*
     https://www.geeksforgeeks.org/sort-an-array-of-0s-1s-and-2s/
     Sort an array of 0s, 1s and 2s
     */
    
    func sort012(arr: [Element]) -> [Element] {
        var arr = arr
        var low = 0
        var mid = 0
        var high = arr.count - 1
        while mid <= high {
            switch arr[mid] {
            case 0:
                arr.swapAt(low, mid)
                low += 1
                mid += 1
            case 1:
                mid += 1
            case 2:
                arr.swapAt(high, mid)
                high -= 1
            default:
                break
            }
        }
        return arr
    }
}
