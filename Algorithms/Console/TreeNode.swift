//
//  TreeNode.swift
//  Console
//
//  Created by Hitesh Agarwal on 11/11/21.
//

import Foundation

class TreeNode {
    var data: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(data: Int, left: TreeNode?, right: TreeNode?) {
        self.data = data
        self.left = left
        self.right = right
    }
}

var root = TreeNode(data: 5,
                    left: TreeNode(data: -10,
                                   left: TreeNode(data: 9,
                                                  left: nil,
                                                  right: nil),
                                   right: TreeNode(data: 8,
                                                   left: nil,
                                                   right: nil)),
                    right: TreeNode(data: 3,
                                    left: TreeNode(data: -4,
                                                   left: nil,
                                                   right: nil),
                                    right: TreeNode(data: 7,
                                                    left: nil,
                                                    right: nil)))

