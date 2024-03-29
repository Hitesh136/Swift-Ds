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
    
    
    
}
