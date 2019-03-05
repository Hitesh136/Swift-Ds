
import XCTest
@testable import DataStructures

class ArrayTestCase: XCTestCase {

    
    func test1_NextLargerElement() {
        XCTAssertEqual( [1, 3, 2, 4].nextLargerElement(), [3, 4, 4, -1])
    }
    
    func test2_NextLargerElement() {
        XCTAssertEqual( [4, 5, 2, 25].nextLargerElement(), [5, 25, 25, -1])
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
