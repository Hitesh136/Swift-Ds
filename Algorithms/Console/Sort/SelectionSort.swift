//
//  SelectionSort.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation

class SelectionSort {
    
}

extension Array where Element: Comparable {
   
   mutating func selectionSort() {
       // https://www.youtube.com/watch?v=xWBP4lzkoyM
       for i in 0..<(count - 1) {
           var minEle = self[i]
           var minEleIndex = i
           for j in (i + 1)..<count {
               if self[j] < minEle {
                   minEle = self[j]
                   minEleIndex = j
               }
           }
           swapAt(i, minEleIndex)
       }
   }
}
