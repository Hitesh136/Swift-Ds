//
//  BinaryTreeTestCase.swift
//  DS
//
//  Created by Hitesh Agarwal on 26/02/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import Foundation
import XCTest
@testable import DS

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
        let deSerializeArray = [7, 1, 0, nil, nil, 5, nil, nil, 9, 8, nil, nil, nil]
        let deSerializeTree = tree.deSerialize(arr: deSerializeArray)
        
        var preOrderTraversalArray = [Int]()
        deSerializeTree?.preOrderTraversal{ preOrderTraversalArray.append($0) }
        XCTAssertEqual(preOrderTraversalArray, [7, 1, 0, 5, 9, 8])
    }
}
