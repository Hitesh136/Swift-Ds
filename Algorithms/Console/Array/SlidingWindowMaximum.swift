//
//  SlidingWindowMaximum.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class SlidingWindowMaximum {
    
}

extension Array where Element: Numeric, Element: Comparable {
     
    /*
     Maximum of all subarrays of size k
     https://practice.geeksforgeeks.org/problems/maximum-of-all-subarrays-of-size-k/0
     */
    func slidingWindowMaximum(_ k: Int) -> [Element] {
        var max: Element = 0
        var j = 0
        var results = [Element]()
        for i in 0..<k {
            if self[i] > max {
                max = self[i]
            }
        }
        
        results.append(max)
        
        for inde in k..<self.count {
            
            //Check if max value is not in the window
            max = self[inde] > max ? self[inde] : max
            if self[j] == max {
                for i in (j + 1)...inde {
                    if self[i] > max {
                        max = self[i]
                    }
                }
            }
            
            j += 1
            results.append(max)
        }
        
        return results
    }
}
