//
//  LeetCode_94.swift
//  Console
//
//  Created by Hitesh Agarwal on 26/04/22.
//

import Foundation
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 *
 */


//https://leetcode.com/problems/binary-tree-inorder-traversal/
class LeetCode_94 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {

        
        func inOrder(_ node: TreeNode?,_ res: inout [Int]) {
            guard let node = node else { return }
            inOrder(node.left, &res)
            res.append(node.val)
            inOrder(node.right,  &res)
        }
        
        var res = [Int]()
        inOrder(root, &res)
        return res
    }
}
