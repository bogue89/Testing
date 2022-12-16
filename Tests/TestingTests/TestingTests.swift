import XCTest
@testable import Testing

final class TestingTests: XCTestCase {
    
    var expectation: () -> Bool = {
        return true
    }
    
    var condition: () -> Bool = {
        print("worky worky")
        return true
    }
    
    func testTestingStatic() throws {
        XCTAssertTrue(Testing.assert(true))
    }
    
    func testTestingGlobal() throws {
        XCTAssertTrue(test(true))
    }
    
    func testTestingStaticCondition() throws {
        XCTAssertTrue(Testing.assert(condition() == expectation()))
    }
    
    func testTestGlobalCondition() throws {
        XCTAssertTrue(test(condition() == expectation()))
    }
    
    func testTestingStaticEqual() throws {
        XCTAssertTrue(Testing.equal(condition(), expectation()))
    }
    
    func testTestGlobalEqual() throws {
        XCTAssertTrue(test(condition(), expectation()))
    }
    
}
