//
//  C1.swift
//  Console
//
//  Created by Hitesh Agarwal on 29/06/21.
//

import Foundation



class Matrix {
    
    var arr = [[Int]]()
    init(i: Int, j: Int, defaultValue: Int) {
        for _ in 0..<i {
            var jArr = [Int]()
            for _ in 0..<j {
                jArr.append(defaultValue)
            }
            arr.append(jArr)
        }
    }
    
    init(_ comp: [[Int]]) {
        self.arr = comp
//        for i in comp.indices {
//            var subArr = [Int]()
//            for ele in comp {
//                subArr.append(ele)
//            }
//            arr[i] = subArr
//        }
    }
    subscript(i: Int, j: Int) -> Int {
        get {
            let jArr = arr[i]
            return jArr[j]
        }
        set {
            var jArr = arr[i]
            jArr[j] = newValue
            arr[i] = jArr
        }
    }
    
    func printMat() {
        for i in 0..<arr.count {
            print(arr[i])
        }
    }
    
    
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
    
    func transformMatrix() {
//    https://leetcode.com/problems/transpose-matrix/
        for r in 0..<arr.count {
            for c in 0..<arr[0].count {
                
                if c > r {
                    if c < arr.count {
                        if r < arr[c].count {
                            let temp = self[r, c]
                            self[r, c] = self[c, r]
                            self[c, r] = temp
                        }
                    }
                }
            }
        }
    }
}
