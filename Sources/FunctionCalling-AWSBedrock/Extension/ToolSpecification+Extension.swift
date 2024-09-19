//
//  ToolSpecification+Extension.swift
//  
//
//  Created by 伊藤史 on 2024/09/18.
//

import FunctionCalling
import AWSBedrockRuntime

extension BedrockRuntimeClientTypes.ToolSpecification {
    init(from tool: FunctionCalling.Tool) throws {
        self.init(
            description: tool.description,
            inputSchema: try .init(from: tool.inputSchema),
            name: tool.name
        )
    }
}
