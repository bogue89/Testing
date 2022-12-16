import XCTest
@testable import Testing

final class EquatableTests: XCTestCase {
    
    func testTestingEqual() throws {
        XCTAssertTrue(Testing.equal("same", "same"))
    }
    
    func testTestingNotEqual() throws {
        XCTAssertFalse(Testing.equal("one", "two"))
    }
}
