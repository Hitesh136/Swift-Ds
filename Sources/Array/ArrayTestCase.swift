
import XCTest
@testable import DataStructures

class ArrayTestCase: XCTestCase {

    
    func test1_NextLargerElement() {
        XCTAssertEqual( [1, 3, 2, 4].nextLargerElement(), [3, 4, 4, -1])
    }
    
    func test2_NextLargerElement() {
        XCTAssertEqual( [4, 5, 2, 25].nextLargerElement(), [5, 25, 25, -1])
    }
    
    func testSubSequence() {
        let array = [1, 101, 2, 3, 100, 4, 5]
        XCTAssertEqual(array.findMaxSumOfSubSequence(), 106)
    }
}

//Subarray with given sum
extension ArrayTestCase {
    func test_1_SubArrayWithSum() {
        let arr = [1, 2, 3, 7, 5]
        XCTAssertEqual(arr.subArray(withSum: 12), [2, 3, 7])
    }
    
    func test_2_SubArrayWithSum() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        XCTAssertEqual(arr.subArray(withSum: 15), [1, 2, 3, 4, 5])
    }
}

//  Sort an array of 0s, 1s and 2s
extension ArrayTestCase {
    func test_First() {
        var arr = [1, 0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1]
        XCTAssertEqual(arr.sort012(arr: arr), [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2])
    }
}

// Sliding Window Array problem
extension ArrayTestCase {
    func test1() {
        let arr = [1, 2, 3, 1, 4, 5, 2, 3, 6]
        
        let result = arr.slidingWindowMaximum(3)
        XCTAssertEqual(result, [3, 3, 4, 5, 5, 5, 6])
    }
    
    func test2() {
        let arr = [8, 5, 10, 7, 9, 4, 15, 12, 90, 13]
        
        let result = arr.slidingWindowMaximum(4)
        XCTAssertEqual(result, [10, 10, 10, 15, 15, 90, 90])
    }
    
    func test3() {
        let arr = [9, 1, 9, 0, 10, 9]
        
        let result = arr.slidingWindowMaximum(3)
        XCTAssertEqual(result, [9, 9, 10, 10])
    }
}

// Reverse array in groups
extension ArrayTestCase {
    
    func test1_reverseArrayOfGroup() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let res = [3, 2, 1, 6, 5, 4, 9, 8, 7]
        
        XCTAssertEqual(arr.reverseArrayOfGroup(k: 3), res)
    }
    
    func test2_reverseArrayOfGroup() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8]
        let res = [5, 4, 3, 2, 1, 8, 7, 6]
        
        XCTAssertEqual(arr.reverseArrayOfGroup(k: 5), res)
    }
    
    func test3_reverseArrayOfGroup() {
        let arr = [1, 2, 3, 4, 5, 6]
        let res = [1, 2, 3, 4, 5, 6]
        
        XCTAssertEqual(arr.reverseArrayOfGroup(k: 1), res)
    }
    
    func test4_reverseArrayOfGroup() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8]
        let res = [8, 7, 6, 5, 4, 3, 2, 1]
        
        XCTAssertEqual(arr.reverseArrayOfGroup(k: 10), res)
    }
}
