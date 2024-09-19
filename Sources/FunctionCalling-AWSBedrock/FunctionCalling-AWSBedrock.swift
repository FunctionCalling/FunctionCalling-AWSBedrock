// The Swift Programming Language
// https://docs.swift.org/swift-book

import FunctionCalling
import AWSBedrockRuntime
import Foundation

let decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    return decoder
}()

extension ToolContainer {
    typealias FunctionCallingTool = FunctionCalling.Tool
    
    public var bedrockAllTools: [BedrockRuntimeClientTypes.Tool] {
        get throws {
            let data = allTools.replacingOccurrences(of: "\n", with: "").data(using: .utf8)!
            let functionCallingTools = try decoder.decode([FunctionCallingTool].self, from: data)
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
