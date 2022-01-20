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
//let s1 = "bd".map{ String($0) }
//let s2 = "abcd".map{ String($0) }
//
//let mat = Matrix(i: s1.count + 1, j: s2.count + 1, defaultValue: -1)
//print(mat.arr)
//for i in 0..<(s1.count + 1) {
//    mat[i, 0] = 0
//}
//for j in 0..<(s2.count + 1) {
//    mat[0, j] = 0
//}
////print(mat.arr)
//func lcs(i: Int, j: Int) {
//    if s1[i - 1] == s2[j - 1] {
//        mat[i, j] = 1 + mat[i - 1, j - 1]
//        print(s1[i - 1])
//    } else {
//        mat[i, j] = max(mat[i - 1, j], mat[i, j - 1])
//    }
//    mat.printMat()
//    print("----")
//}
//
//for i in 1..<s1.count + 1 {
//    for j in 1..<s2.count + 1 {
//        lcs(i: i, j: j)
//    }
//}
//print(mat[s1.count, s2.count])
//
//
 
