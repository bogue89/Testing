import XCTest
extension Testing {
    private class TestSuite: XCTestCase {
        static var testCase: () -> Void = { }
        func test_case() {
            Self.testCase()
        }
    }
    
    private func xctest(testCase: @escaping () -> Void) {
        TestSuite.testCase = testCase
        TestSuite.defaultTestSuite.run()
    }
    
    public static func xctest(assert: @autoclosure @escaping () -> Bool) {
        Testing.xctest(testCase: {
            XCTAssertTrue(assert())
        })
    }
    
    public static func xctest<T: Equatable>(equal: @autoclosure @escaping () -> (T, T)) {
        Testing.xctest(testCase: {
            let results = equal()
            XCTAssertEqual(results.0, results.1)
        })
    }
}
