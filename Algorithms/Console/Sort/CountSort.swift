//
//  CountSort.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation


extension Array where Element: Comparable {
   
    
   
   mutating func countingSort() where Element == Int {
       var min = self[0]
       var max = self[0]
       for ele in self {
           if ele > max {
               max = ele
           }
           if ele < min {
               min = ele
           }
       }
       
       var countArr = Array(repeating: 0, count: (max - min) + 1)
       for n in self {
           countArr[n - min] += 1
       }
       
       var c = 0
       var i = 0
       
       while i < count {
           if countArr[c] == 0 {
               c += 1
           } else {
               self[i] = min + c
               countArr[c] -= 1
               i += 1
           }
       }
   }
}
