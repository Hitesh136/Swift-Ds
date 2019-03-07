//
//  BinaryTreeTestCase.swift
//  DS
//
//  Created by Hitesh Agarwal on 26/02/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import Foundation
import XCTest
@testable import DataStructures

func deSerialize<T>(_ arr: inout [T?]) -> BinaryNode<T>? {
    
    guard let value = arr.removeLast() else {
        return nil
    }
    
    let newNode = BinaryNode(value: value)
    newNode.leftChild = deSerialize(&arr)
    newNode.rightChild = deSerialize(&arr)
    return newNode
}

class BinaryTreeTestCase: XCTestCase {
    
    var tree: BinaryNode<Int> = {
        let zero = BinaryNode(value: 0)
        let one = BinaryNode(value: 1)
        let five = BinaryNode(value: 5)
        let seven = BinaryNode(value: 7)
        let eight = BinaryNode(value: 8)
        let nine = BinaryNode(value: 9)
        
        seven.leftChild = one
        one.leftChild = zero
        one.rightChild = five
        seven.rightChild = nine
        nine.leftChild = eight
        
        return seven
    }()
    
    func testVisualizeTree() {
        print(tree.description)
    }
    
    func testInOrderTraversal() {
        var inOrderTraversal = [Int]()
        tree.inOrderTraversal { inOrderTraversal.append($0) }
        XCTAssertEqual(inOrderTraversal, [0, 1, 5, 7, 8, 9])
    }
    
    func testPreOrderTraversal() {
        var preOrderTraversal = [Int]()
        tree.preOrderTraversal{ preOrderTraversal.append($0) }
        XCTAssertEqual(preOrderTraversal, [7, 1, 0, 5, 9, 8])
    }
    
    func testPostOrderTraversal() {
        var postOrderTraversal = [Int]()
        tree.postOrderTraversal{ postOrderTraversal.append($0) }
        XCTAssertEqual(postOrderTraversal, [0, 5, 1, 8, 9, 7])
    }
    
    func testSerialization() {
        let serializeArray = [7, 1, 0, nil, nil, 5, nil, nil, 9, 8, nil, nil, nil]
        let result = tree.serialize()
        XCTAssertEqual(serializeArray, result)
    }
    
    func testDeSerialization() {
        var deSerializeArray = Array([7, 1, 0, nil, nil, 5, nil, nil, 9, 8, nil, nil, nil].reversed())
        let deSerializeTree = deSerialize(&deSerializeArray)
        
        var preOrderTraversalArray = [Int]()
        deSerializeTree?.preOrderTraversal{ preOrderTraversalArray.append($0) }
        XCTAssertEqual(preOrderTraversalArray, [7, 1, 0, 5, 9, 8])
    }
    
    func test_LeftView() {
        var leftView = [Int]()
        var maxLavel = 0
        
        tree.rightChild?.rightChild = BinaryNode(value: 55)
        tree.rightChild?.rightChild?.rightChild = BinaryNode(value: 66)
        print(tree.description)
        tree.printLeftView(1, &maxLavel) { leftView.append($0) }
        XCTAssertEqual(leftView, [7, 1, 0, 66])
    }
    
    func test_1_isBST() {
        XCTAssertTrue(tree.isBst())
    }
    
    func test_2_isBST() {
        let ten = BinaryNode(value: 10)
        let seven = BinaryNode(value: 7)
        let threeNine = BinaryNode(value: 39)
        let eleven = BinaryNode(value: 11)
        
        ten.leftChild = seven
        ten.rightChild = threeNine
        
        seven.rightChild = eleven
        
        XCTAssertTrue(ten.isBst())
    }
}

//MARK:- BottomView

extension BinaryTreeTestCase {
    
    func test_1_printBottomView() {
        let twenty = BinaryNode(value: 20)
        
        let eight = BinaryNode(value: 8)
        twenty.leftChild = eight
        
        let twentyTwo = BinaryNode(value: 22)
        twenty.rightChild = twentyTwo
        
        let five = BinaryNode(value: 5)
        eight.leftChild = five
        
        let three = BinaryNode(value: 3)
        eight.rightChild = three
        
        let four = BinaryNode(value: 4)
        twentyTwo.leftChild = four
        
        let twentyFive = BinaryNode(value: 25)
        twentyTwo.rightChild = twentyFive
        
        let ten = BinaryNode(value: 10)
        three.leftChild = ten
        
        let fourtheen = BinaryNode(value: 14)
        four.rightChild = fourtheen
        
        var arr = [Int]()
        twenty.bottomView(visit: {arr.append($0)})
        XCTAssertEqual(arr, [5, 10, 4, 14, 25])
    }
    
    func testSpiralTraversal() {
        var result = [Int]()
        tree.spiralTraversal(root: tree, visit: { result.append($0) })
        testVisualizeTree()
        XCTAssertEqual(result, [7, 1, 9, 8, 5, 0])
    }
}
