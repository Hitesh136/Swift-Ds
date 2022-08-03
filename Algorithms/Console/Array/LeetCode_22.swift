//
//  LeetCode_22.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 01/08/2022: Round 2 
class LeetCode_22 {
    
    func generateParenthesis(_ n: Int) -> [String] {
//    https://leetcode.com/problems/generate-parentheses/submissions/
        func printParenthesis(_ peren: String,
                              _ o: Int,
                              _ c: Int,
                              _ n:Int,
                              _ res: inout [String]) {
            
            if c > o {
                return
            }
            
            if c == o && c == n {
                res.append(peren)
            }
            
            if c < n {
                printParenthesis(peren + ")", o, c + 1, n, &res)
            }
            
            if o < n {
                printParenthesis(peren + "(", o + 1, c, n, &res)
                
            }
        }
        
        var res = [String]()
        printParenthesis("(", 1, 0, n, &res)
        return res
    }
    
}
