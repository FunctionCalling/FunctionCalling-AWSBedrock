//
//  Smithy_Document+Extension.swift
//  
//
//  Created by 伊藤史 on 2024/09/18.
//

import FunctionCalling
import Foundation
import struct Smithy.Document

extension Smithy.Document {
    init(from schema: FunctionCalling.InputSchema) throws {
        let data = try JSONEncoder().encode(schema)
        self = try Self.make(from: data)
    }
}
