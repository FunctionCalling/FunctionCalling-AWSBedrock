// The Swift Programming Language
// https://docs.swift.org/swift-book

import FunctionCalling
import AWSBedrockRuntime
import Foundation

extension ToolContainer {
    typealias FunctionCallingTool = FunctionCalling.Tool

    public var bedrockAllTools: [BedrockRuntimeClientTypes.Tool] {
        get throws {
            guard let functionCallingTools = allTools else {
                return []
            }

            return try functionCallingTools.map { try $0.toBedrockTool }
        }
    }
}

extension FunctionCalling.Tool {
    var toBedrockTool: BedrockRuntimeClientTypes.Tool {
        get throws {
            .toolspec(try .init(from: self))
        }
    }
}
