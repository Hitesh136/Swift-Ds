//
//  BubbleSort.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation
class BubbleSort {
    
}

extension Array where Element: Comparable {
    
   
   mutating func bubbleSort() {
       for i in 0..<count {
           for j in 1..<(count - i) {
               if self[j - 1] > self[j] {
                   swapAt(j - 1, j)
               }
           }
       }
   }
}
