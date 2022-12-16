extension Testing {
    public struct Configuration {
        public let message: Message
        public let should: Should
        public static let `default` = Self.init(message: .default,
                                                should: .default)
    }
}

extension Testing.Configuration {
    
    public struct Message {
        public let onSuccess: String
        public let onFailure: String
        public static let `default` = Self.init(onSuccess: "✅ Test passed successfully.",
                                                onFailure: "❌ Test failed.")
    }
    
    public struct Should {
        public let printMessage: Bool
        public let printExecutionTime: Bool
        public let showExpectationOnSuccess: Bool
        public let showExpectationOnFailure: Bool
        public static let `default` = Self.init(printMessage: true,
                                                printExecutionTime: true,
                                                showExpectationOnSuccess: true,
                                                showExpectationOnFailure: true)
    }
    
}
