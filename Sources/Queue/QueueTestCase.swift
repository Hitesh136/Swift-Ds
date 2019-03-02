//
//  QueueTestCase.swift
//  DSTests
//
//  Created by Hitesh Agarwal on 25/02/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import XCTest
@testable import DataStructures

class QueueTestCase: XCTestCase {

    var queue = Queue<Int>()
    override func setUp() {
        queue.enQueue(1)
        queue.enQueue(2)
        queue.enQueue(3)
        queue.enQueue(4)
    }
    
    func test_enqueue() {
        XCTAssertEqual(queue.description, "1 2 3 4")
    }
    
    func test_dequeue() {
        let deQueuedElement = queue.deQueue()
        XCTAssertEqual(deQueuedElement, 1)
    }
    
    func test_peek() {
        XCTAssertEqual(queue.peek, 1)
    }

    func test_isEmpty() {
        XCTAssertEqual(queue.isEmpty, false)
    }
    
    func test_ArrayLiteral() {
        let queueLiteral: Queue = [1 ,2 , 3, 4, 5 ]
        XCTAssertEqual(queueLiteral, [1, 2, 3, 4, 5])
    } 
}
