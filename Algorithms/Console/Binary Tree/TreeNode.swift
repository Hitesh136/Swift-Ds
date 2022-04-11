//
//  TreeNode.swift
//  Console
//
//  Created by Hitesh Agarwal on 11/11/21.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, left: TreeNode?, right: TreeNode?) {
        self.val = value
        self.left = left
        self.right = right
    }
}
 
func getTree() -> TreeNode {
    /*
    Pre Order: [1, 2, 4, 5, 3, 6, 7]
    In Order: [4, 2, 5, 1, 6, 3, 7]
    Post Order: [4, 5, 2, 6, 7, 3, 1]
     */
    let root = TreeNode(value: 1,
                        left: TreeNode(value: 2,
                                       left: TreeNode(value: 4,
                                                      left: nil,
                                                      right: nil),
                                       right: TreeNode(value: 5,
                                                       left: nil,
                                                       right: nil)),
                        right: TreeNode(value: 3,
                                        left: TreeNode(value: 6,
                                                       left: nil,
                                                       right: nil),
                                        right: TreeNode(value: 7,
                                                        left: nil,
                                                        right: nil)))
    
     return root
}
