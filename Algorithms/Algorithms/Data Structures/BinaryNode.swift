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
	
	func getLeafValues() -> [T] {
		if self.leftChild == nil && self.rightChild == nil {
			return [value]
		}
		
		var result = [T]()
		
		if let leftValues = leftChild?.getLeafValues() {
			result.append(contentsOf: leftValues)
		}
		
		if let rightValues = rightChild?.getLeafValues() {
			result.append(contentsOf: rightValues)
		}
		 
		return result
	}
}

extension BinaryNode {
	var asString:String {
		return treeString(self){("\($0.value)",$0.leftChild,$0.rightChild)}
	}
}

extension BinaryNode {
	public func treeString<T>(_ node:T, reversed:Bool=false, isTop:Bool=true, using nodeInfo:(T)->(String,T?,T?)) -> String
	{
		// node value string and sub nodes
		let (stringValue, leftNode, rightNode) = nodeInfo(node)
		
		let stringValueWidth  = stringValue.count
		
		// recurse to sub nodes to obtain line blocks on left and right
		let leftTextBlock     = leftNode  == nil ? []
			: treeString(leftNode!,reversed:reversed,isTop:false,using:nodeInfo)
				.components(separatedBy:"\n")
		
		let rightTextBlock    = rightNode == nil ? []
			: treeString(rightNode!,reversed:reversed,isTop:false,using:nodeInfo)
				.components(separatedBy:"\n")
		
		// count common and maximum number of sub node lines
		let commonLines       = min(leftTextBlock.count,rightTextBlock.count)
		let subLevelLines     = max(rightTextBlock.count,leftTextBlock.count)
		
		// extend lines on shallower side to get same number of lines on both sides
		let leftSubLines      = leftTextBlock
			+ Array(repeating:"", count: subLevelLines-leftTextBlock.count)
		let rightSubLines     = rightTextBlock
			+ Array(repeating:"", count: subLevelLines-rightTextBlock.count)
		
		// compute location of value or link bar for all left and right sub nodes
		//   * left node's value ends at line's width
		//   * right node's value starts after initial spaces
		let leftLineWidths    = leftSubLines.map{$0.count}
		let rightLineIndents  = rightSubLines.map{$0.prefix{$0==" "}.count  }
		
		// top line value locations, will be used to determine position of current node & link bars
		let firstLeftWidth    = leftLineWidths.first   ?? 0
		let firstRightIndent  = rightLineIndents.first ?? 0
		
		
		// width of sub node link under node value (i.e. with slashes if any)
		// aims to center link bars under the value if value is wide enough
		//
		// ValueLine:    v     vv    vvvvvv   vvvvv
		// LinkLine:    / \   /  \    /  \     / \
		//
		let linkSpacing       = min(stringValueWidth, 2 - stringValueWidth % 2)
		let leftLinkBar       = leftNode  == nil ? 0 : 1
		let rightLinkBar      = rightNode == nil ? 0 : 1
		let minLinkWidth      = leftLinkBar + linkSpacing + rightLinkBar
		let valueOffset       = (stringValueWidth - linkSpacing) / 2
		
		// find optimal position for right side top node
		//   * must allow room for link bars above and between left and right top nodes
		//   * must not overlap lower level nodes on any given line (allow gap of minSpacing)
		//   * can be offset to the left if lower subNodes of right node
		//     have no overlap with subNodes of left node
		let minSpacing        = 2
		let rightNodePosition = zip(leftLineWidths,rightLineIndents[0..<commonLines])
			.reduce(firstLeftWidth + minLinkWidth)
			{ max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }
		
		
		// extend basic link bars (slashes) with underlines to reach left and right
		// top nodes.
		//
		//        vvvvv
		//       __/ \__
		//      L       R
		//
		let linkExtraWidth    = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
		let rightLinkExtra    = linkExtraWidth / 2
		let leftLinkExtra     = linkExtraWidth - rightLinkExtra
		
		// build value line taking into account left indent and link bar extension (on left side)
		let valueIndent       = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valueOffset)
		let valueLine         = String(repeating:" ", count:max(0,valueIndent))
			+ stringValue
		let slash             = reversed ? "\\" : "/"
		let backSlash         = reversed ? "/"  : "\\"
		let uLine             = reversed ? "¯"  : "_"
		// build left side of link line
		let leftLink          = leftNode == nil ? ""
			: String(repeating: " ", count:firstLeftWidth)
			+ String(repeating: uLine, count:leftLinkExtra)
			+ slash
		
		// build right side of link line (includes blank spaces under top node value)
		let rightLinkOffset   = linkSpacing + valueOffset * (1 - leftLinkBar)
		let rightLink         = rightNode == nil ? ""
			: String(repeating:  " ", count:rightLinkOffset)
			+ backSlash
			+ String(repeating:  uLine, count:rightLinkExtra)
		
		// full link line (will be empty if there are no sub nodes)
		let linkLine          = leftLink + rightLink
		
		// will need to offset left side lines if right side sub nodes extend beyond left margin
		// can happen if left subtree is shorter (in height) than right side subtree
		let leftIndentWidth   = max(0,firstRightIndent - rightNodePosition)
		let leftIndent        = String(repeating:" ", count:leftIndentWidth)
		let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }
		
		// compute distance between left and right sublines based on their value position
		// can be negative if leading spaces need to be removed from right side
		let mergeOffsets      = indentedLeftLines
			.map{$0.count}
			.map{leftIndentWidth + rightNodePosition - firstRightIndent - $0 }
			.enumerated()
			.map{ rightSubLines[$0].isEmpty ? 0  : $1 }
		
		
		// combine left and right lines using computed offsets
		//   * indented left sub lines
		//   * spaces between left and right lines
		//   * right sub line with extra leading blanks removed.
		let mergedSubLines    = zip(mergeOffsets.enumerated(),indentedLeftLines)
			.map{ ( $0.0, $0.1, $1 + String(repeating:" ", count:max(0,$0.1)) ) }
			.map{ $2 + String(rightSubLines[$0].dropFirst(max(0,-$1))) }
		
		// Assemble final result combining
		//  * node value string
		//  * link line (if any)
		//  * merged lines from left and right sub trees (if any)
		let treeLines = [leftIndent + valueLine]
			+ (linkLine.isEmpty ? [] : [leftIndent + linkLine])
			+ mergedSubLines
		
		return (reversed && isTop ? treeLines.reversed(): treeLines)
			.joined(separator:"\n")
	}
}



//let rootNode = BinaryNode(value: 80)
//rootNode.leftChild = BinaryNode(value: 50)
//rootNode.rightChild = BinaryNode(value: 90)
//rootNode.leftChild?.leftChild = BinaryNode(value: 10)
//rootNode.leftChild?.rightChild = BinaryNode(value: 60)
//
//rootNode.rightChild?.leftChild = BinaryNode(value: 40)
//rootNode.rightChild?.rightChild = BinaryNode(value: 20)


var numbers = [1, 2, 2]
var rootNode = BinaryNode(value: "")
numbers.getPossibleStringsFromNumber(0, rootNode)
print(rootNode.asString)
print("Resluts: \(rootNode.getLeafValues())")
