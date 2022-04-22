//
//  MergeSort.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation
extension Array where Element: Comparable {
   
   mutating func mergeSort() where Element == Int {
       func sort(_ start: Int, _ end: Int) -> [Int] {
           
           if start == end {
               return [self[start]]
           }
           let mid = start + ((end - start) / 2)
           var left = sort(start, mid)
           var right = sort(mid + 1, end)
           
           var j = 0
           var k = 0
           var result = [Int]()
           while j < left.count && k < right.count {
               if left[j] < right[k] {
                   result.append(left[j])
                   j += 1
               } else {
                   result.append(right[k])
                   k += 1
               }
           }
           
           if j < (left.count) {
               let suffix = left.suffix(left.count - j)
               result.append(contentsOf: suffix)
               
           } else if k < (right.count) {
               let suffix = right.suffix(right.count - k)
               result.append(contentsOf: suffix)
               
           }
           return result
       }
       self = sort(0, self.count - 1)
   }
}
