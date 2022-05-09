//
//  Leetcode_104.swift
//  Console
//
//  Created by Hitesh Agarwal on 09/05/22.
//

import Foundation
//https://leetcode.com/problems/maximum-depth-of-binary-tree/
class Leetcode_104 {
    func maxDepth(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0}
            
            let left = maxDepth(root.left)
            let right = maxDepth(root.right)
            
            return 1 + max(left, right)
        }
}
