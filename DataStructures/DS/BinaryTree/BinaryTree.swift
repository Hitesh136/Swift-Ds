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
    
    func deSerialize(arr: [Element?]) -> BinaryNode? {
        var index = 0
        
        func configureNode(currentNode: BinaryNode) {
            
            if currentNode.leftChild == nil {
                let value = arr[index]
                index += 1
                guard let newValue = value else {
                    return
                }
                currentNode.leftChild = BinaryNode(value: newValue)
                configureNode(currentNode: currentNode.leftChild!)
            }
            
            if currentNode.rightChild == nil {
                let value = arr[index]
                index += 1
                guard let newValue = value else {
                    return
                }
                currentNode.rightChild = BinaryNode(value: newValue)
                configureNode(currentNode: currentNode.rightChild!)
            }
        }
        
        guard let first = arr.first, let firstElement = first  else {
            return nil
        }
        let newTree = BinaryNode(value: firstElement)
        configureNode(currentNode: newTree)
        
        return newTree
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
