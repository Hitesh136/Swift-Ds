//
//  BinaryTree.swift
//  Console
//
//  Created by Hitesh Agarwal on 14/03/22.
//

import Foundation


class Solution {
    
    func preOrder(_ node: TreeNode?, res: inout [Int]) {
        guard node != nil else {
            return
        }
        
        res.append(node!.val)
        
        preOrder(node?.left, res: &res)
        preOrder(node?.right, res: &res)
    }
    
    func inOrder(_ node: TreeNode?, res: inout [Int]) {
        guard let node = node else { return }
        inOrder(node.left, res: &res)
        res.append(node.val)
        inOrder(node.right, res: &res)
    }
    
    func postOrder(_ node: TreeNode?, res: inout [Int]) {
        guard let node = node else { return }
        postOrder(node.left, res: &res)
        postOrder(node.right, res: &res)
        res.append(node.val)
    }
    
    func levelOrderTravesal(_ node: TreeNode?, res: inout [[Int]], level: Int) {
        guard let node = node else { return }
        
        var subRes = [Int]()
        if level < res.count {
            subRes = res[level]
            if level & 1 == 0 {
                subRes.append(node.val)
            } else {
                subRes.insert(node.val, at: 0)
            }
            res[level] = subRes
        } else {
            subRes = [node.val]
            res.append(subRes)
        }
        
        levelOrderTravesal(node.left, res: &res, level: level + 1)
        levelOrderTravesal(node.right, res: &res, level: level + 1)
    }
    
    func numberOfInternalNode(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        if node.left == nil && node.right == nil {
            return 0
        } else {
            return 1 + numberOfInternalNode(node.left) + numberOfInternalNode(node.right)
        }
    }
    
    func numberOfEdgeNode(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        if node.left == nil && node.right == nil {
            return 1
        } else {
            return numberOfInternalNode(node.left) + numberOfInternalNode(node.right)
        }
    }
    
    func storeChildrenSumInParentNode(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        let temp = node.val
        let sum = storeChildrenSumInParentNode(node.left) + storeChildrenSumInParentNode(node.right)
        node.val = temp
        return temp + sum
        
    }
    
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
//    https://leetcode.com/problems/search-in-a-binary-search-tree/submissions/
            guard let root = root else { return nil }
            
        if root.val == val {
            return root
        } else if val < root.val {
            return searchBST(root.left, val)
        } else {
            return searchBST(root.right, val)
        }
    }
    
    func rightSideView(_ root: TreeNode?) -> [Int] {
            
        func rightView(_ root: TreeNode?,_ res: inout [Int],_ level: Int) {
            guard let root = root else { return }
            
            if level < res.count {
                res[level] = root.val
            } else {
                res.append(root.val)
            }
            
            rightView(root.left, &res, level + 1)
            rightView(root.right, &res, level + 1)
        }
        
        var res = [Int]()
        rightView(root,&res, 0)
        return res
    }
    
    
    func leftSideView(_ root: TreeNode?) -> [Int] {
            
        func leftSideView(_ root: TreeNode?,_ res: inout [Int],_ level: Int) {
            guard let root = root else { return }
            
            if level < res.count {
                res[level] = root.val
            } else {
                res.append(root.val)
            }
            
            leftSideView(root.right, &res, level + 1)
            leftSideView(root.left, &res, level + 1)
        }
        
        var res = [Int]()
        leftSideView(root,&res, 0)
        return res
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
//    https://leetcode.com/problems/maximum-depth-of-binary-tree/submissions/
        guard let root = root else { return 0}
        
        let left = maxDepth(root.left)
        let right = maxDepth(root.right)
        
        return 1 + max(left, right)
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
//        https://leetcode.com/problems/minimum-depth-of-binary-tree/submissions/
        
        func helper(_ node: TreeNode?) -> Int {
            guard let node = node else { return Int.max }
            
            if node.left == nil && node.right == nil {
                return 1
            }
            
            return 1 + min(helper(node.left), helper(node.right))
        }
        guard let root = root else { return 0}
        
        return helper(root)
    }
       
    func preorderTraversal_Iterative(_ root: TreeNode?) -> [Int] {
//    https://leetcode.com/problems/binary-tree-preorder-traversal/submissions/
        guard let root = root else { return [] }
        var stack = [TreeNode]()
        stack.append(root)
        
        var res = [Int]()
        while !stack.isEmpty {
            let ele = stack.removeLast()
            res.append(ele.val)
            if let right = ele.right {
                stack.append(right)
            }
            
            if let left = ele.left {
                stack.append(left)
            }
        }
        return res
    }
}
