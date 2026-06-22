//
//  CoreError.swift
//  ios-common-kit
//
//  Created by IOSCommonKit on 22/06/26.
//

import Foundation
public extension CoreError {

    enum IveSessionErrorCode: String {
        case invalidToken = "INVALID_TOKEN"
        case sessionForbidden = "SESSION_FORBIDDEN"
        case sessionExpired = "SESSION_EXPIRED"
        case sessionUsageExhausted = "SESSION_USAGE_EXHAUSTED"
        case tooManyRequests = "TOO_MANY_REQUESTS"
    }

    var iveMessageCode: IveSessionErrorCode? {
        let rawValue = errorType ?? messageCode

        guard
            let raw = rawValue?
                .trimmingCharacters(in: .whitespacesAndNewlines),
            !raw.isEmpty
        else {
            return nil
        }

        return IveSessionErrorCode(rawValue: raw.uppercased())
    }

    var isIveInvalidToken: Bool {
        code == 400 || iveMessageCode == .invalidToken
    }

    var isIveSessionForbidden: Bool {
        code == 403 || iveMessageCode == .sessionForbidden
    }

    var isIveSessionExpired: Bool {
        code == 410 || iveMessageCode == .sessionExpired
    }

    var isIveSessionUsageExhausted: Bool {
        code == 429 || iveMessageCode == .sessionUsageExhausted
    }

    var isIveTooManyRequests: Bool {
        code == 429 || iveMessageCode == .tooManyRequests
    }

    var isIveSessionError: Bool {
        isIveInvalidToken ||
        isIveSessionForbidden ||
//        isIveSessionExpired ||
        isIveSessionUsageExhausted ||
        isIveTooManyRequests
    }

    var shouldPopToFlatHomeAfterIveSessionAlert: Bool {
        isIveSessionUsageExhausted || isIveTooManyRequests
    }
}
public struct CoreError: Error {
    public let message: String?
    public let code: Int?
    public let messageCode: String?
    public let errorType: String?

    public init(message: String?, code: Int? = nil, messageCode: String? = nil, errorType: String? = nil) {
        self.message = message
        self.code = code
        self.messageCode = messageCode
        self.errorType = errorType
    }
}

extension CoreError: LocalizedError {
    public var errorDescription: String? { message }
    public var failureReason: String? { message }
}

extension CoreError: Equatable, Hashable {}

extension CoreError: Codable {}
