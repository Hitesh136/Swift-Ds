//
//  MaximumIntervalOverlapingTest.swift
//  AlgorithmsTests
//
//  Created by Hitesh Agarwal on 25/04/21.
//

import XCTest
@testable import Algorithms

class MaximumIntervalOverlapingTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test1() throws {
        
            let pickTime = MaximumIntervalOverlaping().solve(arrivals: [1, 2, 9, 5, 5], exits: [4, 5, 12, 9, 12])
            XCTAssertEqual(pickTime, 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


}
