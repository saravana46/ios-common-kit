//
//  Logger.swift
//  ios-common-kit
//
//  Created by Saravana on 22/06/26.
//

import Alamofire
import Foundation

public extension APIManager {

    func debugPrintAPI(
        url: String,
        method: HTTPMethod,
        headers: HTTPHeaders,
        body: Any?,
        response: AFDataResponse<Data>
    ) {

        print("URL:", url)
        print("METHOD:", method.rawValue)
        print("HEADERS:", headers)

        if let body {
            print("BODY:", body)
        }

        print("STATUS:",
              response.response?.statusCode ?? 0)

        if let data = response.data,
           let json = String(
               data: data,
               encoding: .utf8
           ) {

            print("RESPONSE:", json)
        }
    }
}
