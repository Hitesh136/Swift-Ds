
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
