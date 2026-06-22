//
//  APIErrorResponse.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Foundation

public struct APIErrorResponse: Codable {
    public let error: String?
    public let message: String?
    public let errors: [String: [String]]?

    public init(
        error: String? = nil,
        message: String? = nil,
        errors: [String: [String]]? = nil
    ) {
        self.error = error
        self.message = message
        self.errors = errors
    }
}
