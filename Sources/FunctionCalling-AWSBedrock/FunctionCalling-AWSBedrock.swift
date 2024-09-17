// The Swift Programming Language
// https://docs.swift.org/swift-book

import FunctionCalling
import AWSBedrockRuntime
import Foundation
import struct Smithy.Document

extension ToolContainer {
    typealias FunctionCallingTool = FunctionCalling.Tool

    public var bedrockAllTools: [BedrockRuntimeClientTypes.Tool] {
        get throws {
            let data = allTools.data(using: .utf8)!
            let functionCallingTools = try JSONDecoder().decode([FunctionCallingTool].self, from: data)
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

extension BedrockRuntimeClientTypes.ToolSpecification {
    init(from tool: FunctionCalling.Tool) throws {
        self.init(
            description: tool.description,
            inputSchema: try .init(from: tool.inputSchema),
            name: tool.name
        )
    }
}

extension BedrockRuntimeClientTypes.ToolInputSchema {
    init(from schema: FunctionCalling.InputSchema) throws {
        self = .json(try .init(from: schema))
    }
}

extension Smithy.Document {
    init(from schema: FunctionCalling.InputSchema) throws {
        let data = try JSONEncoder().encode(schema)
        self = try Self.make(from: data)
    }
}
