//
//  JosephusTest.swift
//  AlgorithmsTests
//
//  Created by Hitesh Agarwal on 10/04/21.
//

import XCTest
@testable import Algorithms

class JosephusTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test1() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let n = 5
        let op = JosephusProblem().slove(forPersonsCount: n, rotation: 2)
        let exp = 3
        XCTAssertEqual(op, exp, "JosephusProblem Failed \(op)")
    }

    func test2() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let n = 7
        let op = JosephusProblem().slove(forPersonsCount: n, rotation: 3)
        let exp = 4
        XCTAssertEqual(op, exp, "JosephusProblem Failed \(op)")
    }
    
    func test3() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let n = 3
        let op = JosephusProblem().slove(forPersonsCount: n, rotation: 4)
        let exp = 3
        XCTAssertEqual(op, exp, "JosephusProblem Failed \(op)")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
