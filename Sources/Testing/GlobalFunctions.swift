@discardableResult
public func test(_ condition: @autoclosure () -> Bool,
                 config: Testing.Configuration = .default) -> Bool {
    return Testing.assert(condition(), config: config)
}

@discardableResult
public func test<T: Equatable>(_ value1: @autoclosure () -> T,
                               _ value2: @autoclosure () -> T,
                               config: Testing.Configuration = .default) -> Bool {
    return Testing.equal(value1(), value2(), config: config)
}
