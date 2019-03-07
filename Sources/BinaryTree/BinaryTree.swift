//
//  BinaryTree.swift
//  DS
//
//  Created by Hitesh Agarwal on 26/02/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import Foundation

class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
}

extension BinaryNode: Equatable where Element: Equatable {
    static func == (lhs: BinaryNode<Element>, rhs: BinaryNode<Element>) -> Bool {
        return lhs.value == rhs.value
    }
}

extension BinaryNode {
    func inOrderTraversal(visit: (Element) -> Void ) {
        leftChild?.inOrderTraversal(visit: visit)
        visit(value)
        rightChild?.inOrderTraversal(visit: visit)
    }
    
    func preOrderTraversal(visit: (Element) -> Void ) {
        visit(value)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    
    func postOrderTraversal(visit: (Element) -> Void) {
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(value)
    }
    
    func serialize() -> [Element?]{
        var arr = [Element?]()
        arr.append(value)
        if let left = leftChild {
            arr.append(contentsOf:  left.serialize() )
        } else {
            arr.append(nil)
        }
        
        if let right = rightChild {
            arr.append(contentsOf: right.serialize())
        } else {
            arr.append(nil)
        }
        return arr
    }
}

extension BinaryNode {
    
    func printLeftView(_  curentLevel: Int,_ maxLavel: inout Int,_ appendInArray: (Element) -> Void ) {
        if curentLevel > maxLavel {
            maxLavel = curentLevel
            appendInArray(value)
        }
        leftChild?.printLeftView(curentLevel + 1, &maxLavel, appendInArray)
        rightChild?.printLeftView(curentLevel + 1, &maxLavel, appendInArray)
    }
}

extension BinaryNode {
    
    /*
     Bottom View of Binary Tree
     https://practice.geeksforgeeks.org/problems/bottom-view-of-binary-tree/1
     */
    func bottomView(visit: (Element) -> Void) {
        var map = [Int: [Element]]()
        self.printBottomView(0) { (key, value) in
            if var _ = map[key] {
                map[key]?.append(value)
            } else {
                map[key] = [value]
            }
        }
        for key in Array(map.keys).sorted() {
            visit(map[key]!.last!)
        }
    }
    
    private func printBottomView(_ horizontalDistance: Int,_ visit: (Int, Element) -> ()) {
        if let leftChild = leftChild {
            visit(horizontalDistance - 1, leftChild.value)
            leftChild.printBottomView(horizontalDistance - 1, visit)
        }
        
        if let rightChild = rightChild {
            visit(horizontalDistance + 1, rightChild.value)
            rightChild.printBottomView(horizontalDistance + 1, visit)
        }
    }
}

extension BinaryNode where Element: Comparable {
    
    /*
     Level order traversal in spiral form
     https://www.geeksforgeeks.org/level-order-traversal-in-spiral-form/
     */
    func spiralTraversal(root: BinaryNode?, visit: (Element) -> Void) {
        guard let root = root else {
            return
        }
        
        var s1 = Stack<BinaryNode>()
        var s2 = Stack<BinaryNode>()
        
        s1.push(root)
        
        while !s1.isEmpty() || !s2.isEmpty() {
            while !s1.isEmpty() {
                let top = s1.peek()!
                s1.pop()
                visit(top.value)
                
                if let rightChild = top.rightChild {
                    s2.push(rightChild)
                }
                
                if let leftChild = top.leftChild {
                    s2.push(leftChild)
                }
            }
            
            while !s2.isEmpty() {
                
                let top = s2.peek()!
                s2.pop()
                visit(top.value)
                
                if let leftChild = top.leftChild {
                    s1.push(leftChild)
                }
                
                if let rightChild = top.rightChild {
                    s1.push(rightChild)
                }
                
            }
        }
        
    }
}

extension BinaryNode {
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild,
                       top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild,
                      bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
