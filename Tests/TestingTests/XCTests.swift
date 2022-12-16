import XCTest
@testable import Testing

final class XCTests: XCTestCase {
    
    func testTestingXCTestAssert() throws {
        Testing.xctest(assert: true)
    }
    
    func testTestingXCTestEqual() throws {
        Testing.xctest(equal: ("same", "same"))
    }

}
