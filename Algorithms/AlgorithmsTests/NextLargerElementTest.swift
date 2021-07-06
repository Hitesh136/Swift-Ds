//
//  NextLargerElementTest.swift
//  AlgorithmsTests
//
//  Created by Hitesh Agarwal on 10/04/21.
//

import XCTest
@testable import Algorithms

class NextLargerElementTest: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test1() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let ip = [4, 5, 2, 25]
        let op = ip.nextLargerElement()
        let exp = [5, 25, 25, -1]
        XCTAssertEqual(op, exp, "nextLargerElement failed")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
