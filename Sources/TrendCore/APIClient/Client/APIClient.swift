//
//  APIClient.swift
//  ios-common-kit
//
//  Created by IOSCommonKit on 22/06/26.
//

import Foundation

public protocol APIClient: AnyObject {
    var configuration: APIConfiguration { get }

    func execute<Request: APIRequest>(_ request: Request) async throws -> APIResponse<Request.Response>
}
