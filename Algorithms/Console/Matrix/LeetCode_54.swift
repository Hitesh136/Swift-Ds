//
//  LeetCode_54.swift
//  Console
//
//  Created by Hitesh Agarwal on 23/04/22.
//

import Foundation
//https://leetcode.com/problems/spiral-matrix/
//https://github.com/soapyigu/LeetCode-Swift/blob/master/Array/SpiralMatrix.swift
// 19 July 2022
class LeetCode_54 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
         
        if matrix.count == 0 {
            return []
        }
        var startX = 0
        var endX = matrix.count - 1
        
        var startY = 0
        var endY = matrix[0].count - 1
        var res = [Int]()
        while true {
            
            // Left to right
            for i in startY...endY {
                res.append(matrix[startX][i])
            }
            
            startX += 1
            
            if startX > endX {
                break
            }
            
            // top to bottom
            for i in startX...endX {
                res.append(matrix[i][endY])
            }
            endY -= 1
            
            if endY < startY {
                break
            }
            
            // right to left
            for i in stride(from: endY, through: startY, by: -1) {
                res.append(matrix[endX][i])
            }
            endX -= 1
            
            if endX < startX {
                break
            }
            
            // bottom to top
            for i in stride(from: endX, through: startX, by: -1) {
                res.append(matrix[i][startY])
            }
            startY += 1
            
            if startY > endY {
                break
            }
        }
        return res
    }
}
