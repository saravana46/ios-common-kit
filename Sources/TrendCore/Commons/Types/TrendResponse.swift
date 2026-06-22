//
//  TrendResponse.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Foundation

public typealias PaginationResult<T> = (results: T, isNext: Bool, currentPage: Int)

import Foundation

public struct TrendResponse<T: Decodable>: Decodable {

    public let success: Bool?
    public let message: String?
    public let data: T?

    public init(
        success: Bool?,
        message: String?,
        data: T?
    ) {
        self.success = success
        self.message = message
        self.data = data
    }
}

public extension TrendResponse {

    func unwrap() throws -> T {

        guard success ?? false else {

            throw CoreError(
                message: message ?? "Something went wrong"
            )
        }

        guard let data else {

            throw CoreError(
                message: "Response data missing"
            )
        }

        return data
    }
}
