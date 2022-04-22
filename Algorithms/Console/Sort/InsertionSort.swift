//
//  InsertionSort.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation


extension Array where Element: Comparable {
   
   mutating func insertionSort() {
       //https://www.youtube.com/watch?v=OGzPmgsI-pQ
       for i in 1..<count {
           var x = i
           while (x - 1) >= 0 {
               if self[x - 1] > self[x] {
                   swapAt(x - 1, x)
               }
               x -= 1
           }
       }
   }
}
