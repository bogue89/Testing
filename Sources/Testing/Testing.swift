import XCTest

public struct Testing {
    
    @discardableResult
    public static func assert(_ condition: @autoclosure () -> Bool,
                              config: Testing.Configuration = .default) -> Bool {
        guard config.should.printMessage else {
            return condition()
        }
        let startTime = CFAbsoluteTimeGetCurrent()
        let result = condition()
        let message = result ? config.message.onSuccess : config.message.onFailure
        
        if config.should.printExecutionTime {
            print(message, "(\(String(format: "%.6f", CFAbsoluteTimeGetCurrent() - startTime)) seconds)")
        } else {
            print(message)
        }
        
        return result
    }
    
    public static func equal<T: Equatable>(_ value1: @autoclosure () -> T,
                                           _ value2: @autoclosure () -> T,
                                           config: Testing.Configuration = .default) -> Bool {
        guard config.should.showExpectationOnSuccess || config.should.showExpectationOnFailure else {
            return Self.assert(value1() == value2(), config: config)
        }
        let result1 = value1()
        let result2 = value2()
        let assert = Self.assert(result1 == result2, config: config)
        let message = assert ? "\nis Equal to\n": "\nnot Equal to\n"
        if assert, config.should.showExpectationOnSuccess {
            print("'", result1, "'", message, "'", result2, "'", separator: "")
        }
        if !assert, config.should.showExpectationOnFailure  {
            print("'", result1, "'", message, "'", result2, "'", separator: "")
        }
        return assert
    }
    
}
