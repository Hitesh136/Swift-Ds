//
//  QueueStack.swift
//  DS
//
//  Created by Hitesh Agarwal on 26/02/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import XCTest
@testable import DS

class QueueStackTestCase: XCTestCase {
    
    var queue: QueueStack<Int> = []
    override func setUp() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
    }
    
    func testEnqueue() {
        XCTAssertEqual(queue.description, "1 2 3 4")
    }
    
    func testDequeue() {
        queue.dequeue()
        queue.dequeue()
        queue.dequeue()
        XCTAssertEqual(queue.peek(), 4)
    }
    
    func testIsEmpty() {
        XCTAssertFalse(queue.isEmpty())
        queue.dequeue()
        queue.dequeue()
        queue.dequeue()
        queue.dequeue()
        XCTAssertTrue(queue.isEmpty())
    }
    
    func testPeek() {
        print(queue.description)
        XCTAssertEqual(queue.peek(), 1)
    }
}
