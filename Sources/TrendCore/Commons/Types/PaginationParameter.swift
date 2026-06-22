//
//  PaginationParameter.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Foundation

public struct PaginationParameter: Encodable {
    public let limit: Int = 20
    public var page: Int = 1

    public init() { }
}
