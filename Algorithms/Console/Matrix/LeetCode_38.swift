//
//  LeetCode_36.swift
//  Console
//
//  Created by Hitesh Agarwal on 21/04/22.
//

import Foundation
//https://leetcode.com/problems/valid-sudoku/

class LeetCode_38 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
         return isValidRows(board) && isValidCols(board) && isValidSquars(board)
    }
    
    
    func isValidRows(_ board: [[Character]]) -> Bool {
        
        for i in 0..<board.count {
            
            var setC = Set<Character>()
            for j in 0..<board[0].count {
                if !isValidChar(board[i][j], &setC) {
                    return false
                }
            }
        }
        return true
    }
    
    func isValidCols(_ board: [[Character]]) -> Bool {
        for i in 0..<board[0].count {
            
            var setC = Set<Character>()
            for j in 0..<board.count {
                if !isValidChar(board[j][i], &setC) {
                    return false
                }
            }
        }
        return true
    }
    
    func isValidSquars(_ board: [[Character]]) -> Bool {
        for i in stride(from: 0, to: board.count, by: 3) {
            for j in stride(from: 0, to: board[0].count, by: 3) {
                
                var setC = Set<Character>()
                for m in i..<i + 3 {
                    for n in j..<j + 3 {
                        if !isValidChar(board[m][n], &setC) {
                            return false
                        }
                    }
                }
            }
        }
        return true
    }
    
    func isValidChar(_ char: Character, _ setC: inout Set<Character>) -> Bool {
        if char == "." {
            return true
        }
        
        if setC.contains(char) {
            return false
        } else {
            setC.insert(char)
            return true
        }
    }
}


