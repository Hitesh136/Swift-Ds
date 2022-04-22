//
//  QuickSort.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

extension Array where Element: Comparable {
    
   mutating func quickSort() {
       func sort(_ start: Int, _ end: Int) {
           guard start < end else { return }
           let pivot = self[end]
           var i = -1 + start
           for j in start..<end {
               if self[j] < pivot {
                   i += 1
                   swapAt(i, j)
               }
           }
//            i += start
           i += 1
           swapAt(i, end)
           sort(0, i  - 1)
           sort(i + 1, end)
       }
       sort(0, count - 1)
   }
}
