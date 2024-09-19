//
//  ToolInputSchema+Extension.swift
//  
//
//  Created by 伊藤史 on 2024/09/18.
//

import FunctionCalling
import AWSBedrockRuntime

extension BedrockRuntimeClientTypes.ToolInputSchema {
    init(from schema: FunctionCalling.InputSchema) throws {
        self = .json(try .init(from: schema))
    }
}
