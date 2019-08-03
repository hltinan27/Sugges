//
//  Error.swift
//  Sugges
//
//  Created by Halit İNAN on 3.08.2019.
//  Copyright © 2019 inan. All rights reserved.
//

import Foundation

enum ErrorCode
{
    static let ApiCall = "10000"
    static let ApiFailure = "10001"
}

public struct Error: Codable
{
    public var ErrorCode: Int!
    public var ErrorMessage: String!
    public var Action: Int!
    
    public init(errorCode: String, errorMessage: String)
    {
        self.ErrorCode = 0//errorCode
        self.ErrorMessage = errorMessage
        self.Action = nil
    }
}

struct ErrorWrapper: Codable
{
    var Error: Error!
}
