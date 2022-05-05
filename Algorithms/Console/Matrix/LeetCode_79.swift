//
//  LeetCode_79.swift
//  Console
//
//  Created by Hitesh Agarwal on 26/04/22.
//

import Foundation
//https://leetcode.com/problems/word-search/submissions/
//https://github.com/soapyigu/LeetCode-Swift/blob/master/DFS/WordSearch.swift
class LeetCode_79 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        var arr = Array(word)
        let m = board.count
        let n = board[0].count
        
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if arr[0] == board[i][j] && dfs(board, arr, m, n, i, j, 0, &visited) {
                    return true
                }
            }
        }
        
        return false
    }
    
    
    func dfs(_ board: [[Character]], _ wordArr: [Character], _ m: Int, _ n: Int, _ r: Int, _ c: Int, _ i: Int, _ visited: inout [[Bool]]) -> Bool {
        
        if i == wordArr.count {
            return true
        }
        
        guard (0..<m).contains(r) && (0..<n).contains(c) else {
            return false
        }
        
        guard wordArr[i] == board[r][c] && !visited[r][c] else {
            return false
        }
        
        
        visited[r][c] = true
        if dfs(board, wordArr, m, n, r - 1, c, i + 1, &visited) ||
            dfs(board, wordArr, m, n, r, c - 1, i + 1, &visited) ||
            dfs(board, wordArr, m, n, r, c + 1, i + 1, &visited) ||
            dfs(board, wordArr, m, n, r + 1, c, i + 1, &visited)  {
                
                return true
            }
         
        visited[r][c] = false
        return false
    }
}
 

