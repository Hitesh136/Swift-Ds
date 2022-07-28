//
//  KadensAlgo.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class KadensAlgo {
    
}
// 21 July 2022 Round 2
extension Array where Element == Int {
     
    
//    https://therahulgoel.medium.com/top-array-programs-for-interview-swift-5-0-part-8-63cdbdf3d2dc
    mutating func kadensAlgo() -> Int {
        // https://www.youtube.com/watch?v=HCL4_bOd3-4
        // https://leetcode.com/problems/maximum-subarray/
        var maxSoFar = 0
        var max = 0
        for ele in self {
            max += ele
            if max > maxSoFar {
                maxSoFar = max
            }
            
            if max < 0 {
                max = 0
            }
        }
        return maxSoFar
    }
}
