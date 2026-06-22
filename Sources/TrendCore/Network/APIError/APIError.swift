//
//  APIError.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Foundation

public enum APIError: Error {
    case noInternet
    case unauthorized
    case decoding
    case validation(message: String)
    case server(message: String)
    case unknown
}
