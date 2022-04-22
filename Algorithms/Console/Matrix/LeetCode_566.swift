//
//  LeetCode_566.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation


class LeetCode_566 {
    
    var arr = [[Int]]()
    func reshapeArray(r: Int, c: Int) -> [[Int]] {
//        https://leetcode.com/problems/reshape-the-matrix/
        let size = arr.flatMap{ $0 }.count
        var res = [[Int]]()
        if r * c != size {
            res = arr
        } else {
            
            var tempRow = [Int]()
            var count = 0
            for row in arr {
                for item in row {
                    tempRow.append(item)
                    count += 1
                    
                    if count == c {
                        res.append(tempRow)
                        tempRow = []
                        count = 0
                    }
                    
                }
            }
            
        }
        
        return res
    }
}
