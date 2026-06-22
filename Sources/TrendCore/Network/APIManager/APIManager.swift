//
//  APIManager.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Foundation
import Alamofire
import TrendConfiguration

public final class APIManager {

    // MARK: - Shared

    public static let shared = APIManager()

    private init() {}

    // MARK: - Configuration

    public var defaultHeadersProvider: (() -> HTTPHeaders)?

    public var unauthorizedHandler: (() -> Void)?

    // MARK: - Default Headers

    private var defaultHeaders: HTTPHeaders {

        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

        if let additionalHeaders = defaultHeadersProvider?() {
            additionalHeaders.forEach { key, value in
                headers[key] = value
            }
        }

        return headers
    }

    // MARK: - Request

    public func request<T: Decodable, Body: Encodable>(
        endpoint: String,
        method: HTTPMethod,
        body: Body? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<T, CoreError>) -> Void
    ) {

        let url = Config.apiURL + endpoint

        var finalHeaders = defaultHeaders

        headers?.forEach { key, value in
            finalHeaders[key] = value
        }

        let encoder: ParameterEncoder =
            method == .get
            ? URLEncodedFormParameterEncoder.default
            : JSONParameterEncoder.default

        let afHeaders = Alamofire.HTTPHeaders(finalHeaders)

        AF.request(
            url,
            method: method,
            parameters: body,
            encoder: encoder,
            headers: afHeaders
        )
        .validate()
        .responseData { [weak self] response in

            self?.debugPrintAPI(
                url: url,
                method: method,
                headers: finalHeaders,
                body: body,
                response: response
            )

            switch response.result {

            case .success(let data):

                do {
                    let decodedObject = try JSONDecoder()
                        .decode(T.self, from: data)
                    completion(.success(decodedObject))
                } catch {
                    print("❌ Decoding Error:", error)
                }

            case .failure:

                self?.handleError(
                    response: response,
                    completion: completion
                )
            }
        }
    }
}
