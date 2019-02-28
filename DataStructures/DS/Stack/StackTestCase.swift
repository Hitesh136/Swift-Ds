//
//  StackTestCase.swift
//  DS
//
//  Created by Hitesh Agarwal on 25/02/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import XCTest
@testable import DS

class StackTestCase: XCTestCase {

    var stack = Stack<Int>()
    
    override func setUp() {
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
    }

    func test_push() {
        XCTAssertEqual("1 2 3 4", stack.description)
    }
    
    func test_pop() {
        stack.pop()
        XCTAssertEqual("1 2 3", stack.description)
    }
    
    func test_peek() {
        XCTAssertEqual(4, stack.peek())
    }
    
    func test_isEmpty() {
        XCTAssertEqual(false, stack.isEmpty())
    }
    
    func test_initWithArray() {
        let stack = Stack(withArray: [1, 2, 3, 4])
        XCTAssertEqual(stack, [1 ,2 ,3,   4])
    }
    
    func test_ArrayLiteral() {
        let stack: Stack = ["One", "Two", "Three"]
        XCTAssertEqual(stack, ["One", "Two", "Three"])
    }
}
