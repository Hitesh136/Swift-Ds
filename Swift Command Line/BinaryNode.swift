//
//  Queue.swift
//  Swift Command Line
//
//  Created by Hitesh  Agarwal on 05/09/19.

import Foundation

class BinaryNode<T: Equatable> {
	var value: T
	var leftChild: BinaryNode?
	var rightChild: BinaryNode?
	var nextChild: BinaryNode?
	
	init(value: T) {
		self.value = value
	}
}

extension BinaryNode: Equatable where T: Equatable {
	static func == (lhs: BinaryNode<T>, rhs: BinaryNode<T>) -> Bool {
		return lhs.value == rhs.value
	}
}

extension BinaryNode {
    var inOrderTraverseString: String {
        return inOrderTraverse().map{ String(describing: $0)}.joined(separator: " -> ")
    }
    
    var levelOrderTraverseString: String {
        var levelValues = [T]()
        var queue = Queue<BinaryNode>()
        queue.enQueue(self)
        deQueue(queue: queue) { (value) in
            levelValues.append(value)
        }
        
        return levelValues.map{ String(describing: $0) }.joined(separator: ",")
    }
    
    private func inOrderTraverse() -> [T] {
        var result = [T]()
        result.append(value)
        if let leftData = self.leftChild {
            result.append(contentsOf: leftData.inOrderTraverse())
        }
        
        if let rightData = self.rightChild {
            result.append(contentsOf: rightData.inOrderTraverse())
        }
        return result
    }
    
    func levelOrderTraversing(append: (Int) -> Void) {
        
    }
    
	func deQueue(queue: Queue<BinaryNode>, append: (T) -> Void) {
        guard !queue.isEmpty else {
            return
        }
        var qu = queue
		guard let dequeueNode = qu.deQueue() else {
			return
		}
		
		append(dequeueNode.value)
        
		if let leftNode = dequeueNode.leftChild {
            qu.enQueue(leftNode)
        }
        
		if let rightNode = dequeueNode.rightChild {
            qu.enQueue(rightNode)
        }
        
        deQueue(queue: qu, append: append)
    }
    
    func getHeight() -> Int {
        var leftHeight = 0
        var rightHeight = 0
        
        if let leftNode = self.leftChild {
            leftHeight = leftNode.getHeight() + 1
        }
        
        if let rightNode = self.rightChild {
            rightHeight = rightNode.getHeight() + 1
        }
        
        return max(leftHeight, rightHeight)
    }
    
    func connecToNext() {
        self.leftChild?.nextChild = self.rightChild ?? self.nextChild?.leftChild ?? self.nextChild?.rightChild
        self.rightChild?.nextChild = self.nextChild?.leftChild ?? self.nextChild?.rightChild
        
        self.leftChild?.connecToNext()
        self.rightChild?.connecToNext()
    }
}


extension BinaryNode where T: Comparable{
    func insert(newValue: T) {
        if newValue < self.value {
            if let leftNode = self.leftChild {
                leftNode.insert(newValue: newValue)
            } else {
                let newLeftNode = BinaryNode(value: newValue)
                self.leftChild = newLeftNode
            }
        } else if newValue > self.value {
            if let rightNode = self.rightChild {
                rightNode.insert(newValue: newValue)
            } else {
                let newRightNode = BinaryNode(value: newValue)
                self.rightChild = newRightNode
            }
        }
    }
}

extension Array where Element: Comparable{
    func getBinaryTree() -> BinaryNode<Element>? {
        guard let firstVaue = self.first else {
            return nil
        }
        
        let binaryTree = BinaryNode<Element>(value: firstVaue)
        for index in 1..<self.count {
            let value = self[index]
            binaryTree.insert(newValue: value)
        }
        return binaryTree
    }
}


extension BinaryNode {
	func inOrderTraversal(visit: (T) -> Void ) {
		leftChild?.inOrderTraversal(visit: visit)
		visit(value)
		rightChild?.inOrderTraversal(visit: visit)
	}
	
	func preOrderTraversal(visit: (T) -> Void ) {
		visit(value)
		leftChild?.preOrderTraversal(visit: visit)
		rightChild?.preOrderTraversal(visit: visit)
	}
	
	func postOrderTraversal(visit: (T) -> Void) {
		leftChild?.postOrderTraversal(visit: visit)
		rightChild?.postOrderTraversal(visit: visit)
		visit(value)
	}
	
	func serialize() -> [T?]{
		var arr = [T?]()
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
	
	func printLeftView(_  curentLevel: Int,_ maxLavel: inout Int,_ appendInArray: (T) -> Void ) {
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
	func bottomView(visit: (T) -> Void) {
		var map = [Int: [T]]()
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
	
	private func printBottomView(_ horizontalDistance: Int,_ visit: (Int, T) -> ()) {
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

extension BinaryNode where T: Comparable {
	
	/*
	Level order traversal in spiral form
	https://www.geeksforgeeks.org/level-order-traversal-in-spiral-form/
	*/
	func spiralTraversal(root: BinaryNode?, visit: (T) -> Void) {
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
