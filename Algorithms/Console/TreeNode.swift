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


//var n7 = TreeNode(data: 7, left: nil, right: nil)
//var n8 = TreeNode(data: 8, left: nil, right: nil)
//var n5 = TreeNode(data: 5, left: n7, right: n8)
// 
//var n4 = TreeNode(data: 4, left: nil, right: nil)
//var n2 = TreeNode(data: 2, left: n4, right: n5)
//
//var n9 = TreeNode(data: 9, left: nil, right: nil)
//var n6 = TreeNode(data: 6, left: n9, right: nil)
//
//var n3 = TreeNode(data: 3, left: nil, right: n6)
//
//
//var n1 = TreeNode(data: 1, left: n2, right: n3)
//
//print(n1)
