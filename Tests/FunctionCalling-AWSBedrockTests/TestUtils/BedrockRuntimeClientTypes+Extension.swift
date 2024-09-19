//
//  BedrockRuntimeClientTypes+Extension.swift
//  FunctionCalling-AWSBedrock
//
//  Created by 伊藤史 on 2024/09/19.
//

import AWSBedrockRuntime

extension BedrockRuntimeClientTypes.Tool {
    var toolSpecification: BedrockRuntimeClientTypes.ToolSpecification? {
        switch self {
        case .toolspec(let specification):
            return specification
        case .sdkUnknown:
            return nil
        }
    }
}
