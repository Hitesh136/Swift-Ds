//
//  BinarySearchTestCase.swift
//  DS
//
//  Created by Hitesh  Agarwal on 3/1/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import Foundation
import XCTest
@testable import DS

class BinarySearchTestCase: XCTestCase {
    
    func testBinarySearch() {
        let arr = [1, 5, 18, 32, 33, 33, 47, 49, 502]
        XCTAssertEqual(arr.binarySearch(for: 47), 6)
    }
    
    func testRange() {
        let arr = [1, 2, 3, 3, 3, 4, 5, 5]
        XCTAssertEqual(arr.searchRange(for: 5), 6...7)
    }
}
